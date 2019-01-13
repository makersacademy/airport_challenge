require_relative 'airport'
require_relative 'plane'
require_relative 'weather'

module RunAirport

  airports = { }

  def create_airport
    print "Please type the name of your airport, if you do not input a name, the name will be 'Heathrow' by default:> "
    airport_name = STDIN.gets.chomp
    print "Please type the capacity of your airport, if you do not input a number - 5 by default:> "
    airport_capacity = STDIN.gets.chomp
    airport_capacity = 5 unless airport_capacity.is_a? Integer
    print "Please type the initial number of planes you want with your new airport - 1 by default:> "
    initial_number_of_planes = STDIN.gets.chomp
    initial_number_of_planes = 1 unless airport_capacity.is_a? Integer
    puts "Creating an airport..."
    $current_airport = Airport.new(airport_name.to_s, airport_capacity, initial_number_of_planes)
  end

  def save_airport
    airports[:$new_airport.name] = $current_airport
  end

  def create_a_plane
    $current_plane = Plane.new
  end

  def add_plane_to_airport
    print "Attempting to add new plane to your airport..."
    fail "This plane has already been added!" if $current_airport.landing_area.all? { |landed_plane| landed_plane.object_id != plane.object_id }
    fail "No more space!" unless $current_airport.length == $current_airport.airport_capacity
    $current_airport.push($current_plane)
    print "New plane was successfully added to your airport!"
  end

  def choose_airport
    puts "Here are the airports: "
    airports.each { |airport| puts "#{airport.name}" }
    print "Please type the airport name you want: "
    airport_name = STDIN.gets.chomp
    fail "Does not exist!" unless airports.has_key?(:airport_name)
    $current_airport = airports[:airport_name]
  end

  def land_plane
  end

  def take_off_plane
    puts "Here are the planes currently at #{$current_airport}"
    $current_airport.landing_area.map
    print "Please type the plane number you want - the first being 1:> "
    plane_number = STDIN.gets.chomp
    puts "Taking off from #{$current_airport.name}..."
    $current_airport.take_off($current_airport.landing_area[plane_number])
  end

end

module Options

  include RunAirport

  def system_options
    puts "Airport Options"
    puts "/n"
    puts "1. Create airport"
    puts "2. Create plane"
    puts "3. Add plane to your airport"
    puts "4. Land plane"
    puts "5. Take off plane"
    puts "6. Save your airport"
    puts "7. Exit system"
    puts "/n"
    puts "Please type your option by number:"
    $option_choice = STDIN.gets.chomp
    executing_option($option_choice)
  end

  def executing_option(option_choice)
    puts "Executing option..."
    if option_choice == 1
      create_airport
    elsif option_choice == 2
      create_a_plane
    elsif option_choice == 3
      add_plane_to_airport
    elsif option_choice == 4
      land_plane
    elsif option_choice == 5
      take_off_plane
    elsif option_choice == 6
      save_airport
    elsif option_choice == 7
      Process.exit
    end
  end

end

include Options
system_options
