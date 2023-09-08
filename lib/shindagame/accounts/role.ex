defmodule Gamewin.Accounts.Role do
  @spec frontend_access() :: String.t()
  def frontend_access(), do: "frontend"

  @spec admin_access() :: String.t()
  def admin_access(), do: "admin"

  @spec superuser_access() :: String.t()
  def superuser_access(), do: "superuser"

  
end
