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
    Manage webhooks in Rally.
  """
  require Logger
  alias Rallex.WebhookRequest
  alias Rallex.Rally

  @doc false
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
    Create a new webhook
  """
  @spec create(WebhookRequest.t, String.t) :: {atom, any}
  def create(webhook, api_key) do
    GenServer.call(__MODULE__, {:create, webhook, api_key})
  end

  @doc false
  def init(:ok) do
    {:ok, []}
  end

  @doc false
  def handle_call({:create, webhook, api_key}, _from, state) do
    case Rally.create_webhook(webhook, api_key) do
      {:ok, body} ->
        {:reply, :ok, state}
      {:error, body} ->
        {:reply, :error, state}
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
