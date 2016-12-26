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
defmodule Rallex.RallyUtilities do
  require Logger
  @moduledoc """
    Utilities for interacting with Rally
  """

  @doc """
    Returns a map with the correct headers for Rally.
  """
  @spec headers(String.t) :: %{String.t => String.t}
  def headers(rally_api_key) do
    %{
      "ZSESSIONID" => rally_api_key
    }
  end

  @doc """
    Produces an array formatted for hackney and Rally.
  """
  @spec cookie(String.t) :: []
  def cookie(rally_api_key) do
    [cookie: ["ZSESSIONID=#{rally_api_key}"]]
  end

end
