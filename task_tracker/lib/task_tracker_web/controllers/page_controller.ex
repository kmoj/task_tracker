defmodule TaskTrackerWeb.PageController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Job
  alias TaskTracker.Job.Task

  def index(conn, _params) do
    render conn, "index.html"
  end

end
