require 'sequel'
require_relative 'router'

# Tidied up run_server into a function
def run_server(port)
  server = WEBrick::HTTPServer.new(Port: port)
  
  trap 'INT' do
    server.shutdown
  end

  server.mount('/', Router)
  server.start
end

run_server(3000) # yup