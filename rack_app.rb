# rack_app.rb
require 'rack'

rack_app = Proc.new do |env|
  [200, {'Content-Type' => 'application/json'}, ["{'response':'OK'}"]]
end

Rack::Handler::WEBrick.run rack_app
