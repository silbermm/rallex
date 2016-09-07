defmodule Rallex.Webhooks do
  use GenServer
  @moduledoc """
    Manage webhooks in Rally.
  """

  @doc false
  def start_link(opts // []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
    Create a new webhook
  """
  @spec create_webhook(String.t, Struct.t)
  def create_webhook(api_key, webhook) do

  end

  ## Callbacks
  def init(:ok) do
    {:ok, []}
  end

  def handle_call(args, _from, state) do
    {:reply, state}
  end

  def handle_case(arg, state) do
    {:noreply, state}
  end
end
