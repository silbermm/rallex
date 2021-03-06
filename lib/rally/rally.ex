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
  use GenServer
  @moduledoc """
    Interact with Rally via thier [Lookback API](https://rally1.rallydev.com/analytics/doc/#/manual)
  """

  require Logger
  alias Rallex.RallyUtilities

  @lookbackurl "https://rally1.rallydev.com/analytics/v2.0/service/rally/workspace/"

  @doc false
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

end
