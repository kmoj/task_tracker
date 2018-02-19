defmodule TaskTrackerWeb.Plugs do
  use TaskTrackerWeb, :router

  def get_current_user(conn, _param) do
    user_id = get_session(conn, :user_id)
    if user_id do
      user = TaskTracker.Accounts.get_user!(user_id)
      assign(conn, :current_user, user)
    else
      assign(conn, :current_user, nil)
    end
  end

end
