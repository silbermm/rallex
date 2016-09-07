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
