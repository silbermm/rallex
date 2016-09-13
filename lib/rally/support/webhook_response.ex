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
defmodule Rallex.WebhookResponse do
  @type t :: %Rallex.WebhookResponse{
    LastUpdateDate: String.t,
    Expressions: [map],
    SubscriptionID: number,
    _ref: String.t,
    TargetUrl: String.t,
    Disabled: bool,
    Name: String.t,
    AppName: String.t,
    CreationDate: String.t,
    AppUrl: String.t
  }
  @derive [Poison.Encoder]
  defstruct LastUpdateDate: nil,
    Expressions: [],
    SubscriptionID: nil,
    _ref: nil,
    TargetUrl: nil,
    Disabled: true,
    Name: nil,
    AppName: nil,
    CreationDate: nil,
    AppUrl: nil
end
