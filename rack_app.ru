# rack_app.ru

app = Proc.new do |env|
  [200, {'Content-Type' => 'application/json'}, ["{'response':'OK'}"]]
end

run app
