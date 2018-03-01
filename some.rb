require 'rack'

class App
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["hello world!"]]
  end
end

Rack::Handler::WEBrick.run(App.new)
