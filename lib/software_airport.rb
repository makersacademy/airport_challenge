require './lib/class_airport'
require './lib/class_plane'

def interface
  action_request = ''

  while action_request != "exit"
    # minimal interface - replace with command checker later
    # command checker to only allow 'valid' actions
    puts "What would you like to do?"
    puts "list, land-<plane>, exit"
    action_request = gets.chomp

  end
end
