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
defmodule Rallex do
  @moduledoc """
    Library to interact with Rally
  """
  use Application

  @doc false
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Rallex.Webhooks, [[name: Rallex.Webhooks]]),
    ]

    opts = [strategy: :one_for_one, name: Rallex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
