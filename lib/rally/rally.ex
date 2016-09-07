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
