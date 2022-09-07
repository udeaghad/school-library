require_relative 'app'
require 'pry'

def main
  run_app = App.new
  run_app.run
end

main
