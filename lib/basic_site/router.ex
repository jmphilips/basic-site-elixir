defmodule BasicSite.Router do
    use Plug.Router
    use Plug.Debugger
    
    plug Plug.Logger
    plug Plug.Static, at: "/", from: :basic_site
    plug :match
    plug :dispatch

    get "/" do
        send_resp(conn, 200, "Hi from plug")
    end

    get "/bug" do
        raise "WAT"
    end

     get "/:name" do
        send_resp(conn, 200, EEx.eval_file("templates/name.eex", [name: name]))
    end

end