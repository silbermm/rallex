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
defmodule Rallyex.Rally do
  require Logger
  @moduledoc """
    Interact with Rally via thier [Lookback API](https://rally1.rallydev.com/analytics/doc/#/manual) and the [Webhook API](https://rally1.rallydev.com/notifications/docs/webhooks)
  """

  @lookbackurl "https://rally1.rallydev.com/analytics/v2.0/service/rally/workspace/"
  @webhookurl "https://rally1.rallydev.com/notifications/api/v2"

  #def query(workspace_id, query_str, api_key) do
    #end

  #@spec create_webhook(Struct.t, String.t) :: {atom, Map.t}
  #def create_webhook(webhook, api_key) do
    #case HTTPoison.post("#{@webhookurl}/", webook, cookie(api_key)) do
      #{:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        #{:ok, body}
      #{:ok, response} ->
        #{:ok, response.body}
      #{:error, %HTTPoison.Error{reason: reason}} ->
        #{:error, reason}
    #end
  #end

 # defp headers(rally_api_key) do
    #%{
      #"ZSESSIONID" => rally_api_key
    #}
  #end

  #defp cookie(rally_api_key) do
    #hackney: [cookie: ["ZSESSIONID=#{rally_api_key}"]]
  #end

end
