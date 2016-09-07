# This file is part of Rallex.
#
# Rallex is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Rallex is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Rallex.  If not, see <http://www.gnu.org/licenses/>.
defmodule Rallex.Rally do
  require Logger
  @moduledoc """
    Interact with Rally via thier [Lookback API](https://rally1.rallydev.com/analytics/doc/#/manual) and the [Webhook API](https://rally1.rallydev.com/notifications/docs/webhooks)
  """
  
  alias Rallex.WebhookRequest

  @lookbackurl "https://rally1.rallydev.com/analytics/v2.0/service/rally/workspace/"
  @webhookurl "https://rally1.rallydev.com/notifications/api/v2/webhook"

  def query(workspace_id, query_str, api_key) do
  end

  @spec create_webhook(WebhookRequest.t, String.t) :: {atom, map}
  def create_webhook(webhook, api_key) do
    post_body = Poison.encode!(webhook)
    case HTTPoison.post(@webhookurl, post_body, [], hackney: cookie(api_key)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, response} ->
        {:ok, response.body}
      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error "error creating webhook"
        IO.inspect reason
        {:error, reason}
    end
  end

  def list_webhooks(webhook_query, api_key) do
    case HTTPoison.get("#{@webhookurl}?pagesize=#{webhook_query.pagesize}&start=#{webhook_query.start}", [], hackney: cookie(api_key)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, response} ->
        {:ok, response.body}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def list_webhooks(api_key) do
    list_webhooks(20, api_key)
  end

  defp headers(rally_api_key) do
    %{
      "ZSESSIONID" => rally_api_key
    }
  end

  defp cookie(rally_api_key) do
    [cookie: ["ZSESSIONID=#{rally_api_key}"]]
  end

end
