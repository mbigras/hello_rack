require 'rack'
require 'pp'

class App
  def call(env)
    pp env
    [200, {"Content-Type" => "text/html"}, ["hello world!"]]
  end
end

class Middleware
  def initialize(app)
    @app = app
  end

  def call(env)
    env["rack.some_header"] = "setting an example"
    @app.call(env)
  end
end

app = Rack::Builder.app do
  use Middleware
  run App.new
end

Rack::Handler::WEBrick.run(app)
