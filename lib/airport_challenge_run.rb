require 'airport'
require 'plane'

module RunAirport

  def create_airport
    print "Please type the name of your airport: "
    airport_name = STDIN.gets.chomp
    print "Please type the capacity of your airport, if you do not input a number, the capacity is 10 by default: "
    airport_capacity = STDIN.gets.chomp
    airport_capacity = 10 unless airport_capacity.is_a? Integer
    puts "Creating an airport..."
    Airport.new(airport_name.to_s, airport_capacity)
  end

  def choose_airport
    puts "Here are the airports: "
    ObjectSpace.each_object(Airport).name.to_a
    print "Please type the airport name you want: "
    airport_name = STDIN.gets.chomp
    fail "Does not exist!" if airport_name
  end

  def take_off_plane
    puts "Here are the airports: "
    ObjectSpace.each_object(Airport).name.to_a
    print "Please type the airport name you want"
  end

end
