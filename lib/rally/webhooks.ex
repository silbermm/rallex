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
defmodule Rallex.Webhooks do
  use GenServer
  @moduledoc """
    Manage webhooks in Rally via thier [Webhook API](https://rally1.rallydev.com/notifications/docs/webhooks)

  """
  require Logger
  alias Rallex.WebhookRequest
  alias Rallex.WebhookRequest
  alias Rallex.WebhookResponse
  alias Rallex.Rally

  @webhookurl "https://rally1.rallydev.com/notifications/api/v2/webhook"

  @doc false
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
    Create a new webhook. Returns the Webhook that was created.
  """
  @spec create(WebhookRequest.t, String.t) :: {:ok, WebhookResponse.t} | {:error, String.t}
  def create(webhook, api_key) do
    GenServer.call(__MODULE__, {:create, webhook, api_key})
  end

  @doc """
    Delete a webhook based on the `_refurl`

    Returns `{:ok, message}` or `{:error, reason}`

  """
  @spec delete(String.t, String.t) :: {atom, String.t}
  def delete(webhook_ref_url, api_key) do
    GenServer.call(__MODULE__, {:delete, webhook_ref_url, api_key})
  end

  @doc """
    List webhooks for a specific apikey.
  """
  @spec list(number, number, String.t) :: {atom, map}
  def list(page_size, start_page, api_key) do
    GenServer.call(__MODULE__, {:list, page_size, start_page, api_key})
  end

  @doc """
    List webhooks for a specific apikey. Defaults to a page size of 20 and the first page.
  """
  @spec list(String.t) :: {atom, map}
  def list(api_key) do
    GenServer.call(__MODULE__, {:list, 20, 1, api_key})
  end

  @doc false
  def init(:ok) do
    {:ok, []}
  end

  @doc false
  def handle_call({:create, webhook, api_key}, _from, state) do
    post_body = Poison.encode!(webhook)
    case HTTPoison.post(@webhookurl, post_body, [], hackney: Rally.cookie(api_key)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        #TODO: decode into WebhookResponse
        response = Poison.decode(body, as: %WebhookResponse{})
        {:reply, response, state}
      {:ok, response} ->
        {:reply, {:error, response.body}, state}
      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error "error creating webhook"
        {:reply, {:error, reason}, state}
    end
  end

  @doc false
  def handle_call({:delete, webhook_ref_url, api_key}, _from, state) do
    case HTTPoison.delete(webhook_ref_url, [], hackney: Rally.cookie(api_key)) do
      {:ok, %HTTPoison.Response{status_code: 200}} ->
        {:reply, {:ok, "Successfully deleted Webhook"}, state}
      {:ok, %HTTPoison.Response{status_code: 401}} ->
        {:reply, {:error, "unauthorized"}, state}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:reply, {:error, reason}, state}
    end
  end

  def handle_call({:list, page_size, start_page, api_key}, _from, state) do
    case HTTPoison.get("#{@webhookurl}?pagesize=#{page_size}&start=#{start_page}", [], hackney: Rally.cookie(api_key)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        response = Poison.decode(body, as: %{"Results" => [%WebhookResponse{}]})
        {:reply, response, state}
      {:ok, response} ->
        {:reply, {:ok, response.body}, state}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:reply, {:error, %{reason: reason}}, state}
    end
  end

  @doc false
  def handle_call(args, _from, state) do
    {:reply,:ok,  state}
  end

  @doc false
  def handle_case(arg, state) do
    {:noreply, state}
  end

end
