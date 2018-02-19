defmodule TaskTrackerWeb.SessionController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Accounts
  alias TaskTracker.Accounts.User

  def create(conn, %{"name" => name}) do

    #IO.puts(email)
    user = Accounts.get_user_by_name(name)

    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Hi, #{user.name}")
      |> redirect(to: task_path(conn, :index))
    else
      conn
      |> put_flash(:error, "The name is not found")
      |> redirect(to: page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out")
    |> redirect(to: page_path(conn, :index))
  end

end
