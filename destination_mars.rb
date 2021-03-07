require './lib/airport'
require './lib/plane'

$mars_airports
$mars_planes

def welcome
    puts "Welcome to Mars!"
end

def initialize_control
    $mars_airports = []
    $mars_planes = []

    # first airport (default 10 planes capacity)
    $mars_airports << Airport.new
    # 15 planes
    15.times { $mars_planes << Plane.new }
end

def print_menu
    puts "1. Show airport(s) information"
    puts "2. Show plane(s) information"
    puts "3. Land a plane"
    puts "4. Take off a plane"
    puts "5. Build an extra airport"
    puts "6. Add a plane"
    puts "7. Exit"
end

def process(selection)
    case selection
    when "1"
        print_airports
    when "2"
        print_planes
    when "3"
        land_plane
    when "4"
        take_off_plane
    when "5"
        build_airport
    when "6"
        add_plane
    when "7"
        exit
    else
        puts "Invalid selection, try again"
    end
end

def print_airports
    puts "--------------------------------------"
    puts "Martian Airports"
    puts "--------------------------------------"
    $mars_airports.each { |airport| puts "Airport: #{airport.name}, Capacity: #{airport.capacity}"}
    puts ""
end

def print_planes
    puts "--------------------------------------"
    puts "Martian Planes"
    puts "--------------------------------------"
    $mars_planes.each { |plane| puts "Plane: #{plane.name}, Status: #{plane.status} #{ plane.airport.name if !plane.airport.nil?}"}
    puts ""
end

def land_plane
    planes_idx = plane_idx_to_land
    airports_idx = valid_airport_idx
    plane_idx = nil
    airport_idx = nil
    if planes_idx.empty?
        puts "No plane to land"
        return
    end
    if airports_idx.empty?
        puts "No airport has spare capacity"
        return
    end
    loop do
        puts "Planes to land: #{planes_idx.join(",")}"
        puts "Select a plane number to land"
        begin
            plane_idx = gets.chomp.to_i
        rescue => error
            puts error.message
        end
        planes_idx.include?(plane_idx) ? break : (puts "Invalid number, try again")
    end

    loop do
        puts "Airports available: #{airports_idx.join(",")}"
        puts "Select a airport number to land"
        begin
            airport_idx = gets.chomp.to_i
        rescue => error
            puts error.message
        end
        airports_idx.include?(airport_idx) ? break : (puts "Invalid number, try again")
    end

    puts "Please try again later" if !land_plane_on_airport(airport_idx, plane_idx)
end

# airport with spare capacity
def valid_airport_idx
    idx = []
    $mars_airports.each { |airport| idx << airport.name.gsub("Colony ", "").to_i if airport.capacity > 0 }
    idx
end

def plane_idx_to_land
    # valid_planes = $mars_planes.select { |plane| plane.status != 'land' }
    idx = []
    $mars_planes.each { |plane| idx << plane.name.gsub("Explorer ", "").to_i if plane.status != 'land' }
    idx
end

def land_plane_on_airport(airport_idx, plane_idx)
    begin
        check_index_valid(airport_idx, $mars_airports, "airport")
        check_index_valid(plane_idx, $mars_planes, "plane")
        $mars_airports[airport_idx-1].land($mars_planes[plane_idx-1])
    rescue => error
        puts error.message
        return false
    else
        puts "#{$mars_planes[plane_idx-1].name} landed at #{$mars_airports[airport_idx-1].name} airport"
        return true
    end
end

def take_off_plane
    planes_idx = plane_idx_to_take_off
    plane_idx = nil
    if planes_idx.empty?
        puts "No plane to take off"
        return
    end
    loop do
        puts "Planes to take off: #{planes_idx.join(",")}"
        puts "Select a plane number to take off"
        begin
            plane_idx = gets.chomp.to_i
        rescue => error
            puts error.message
        end
        planes_idx.include?(plane_idx) ? break : (puts "Invalid number, try again")
    end

    puts "Please try again later" if !take_off_plane_from_airport(plane_idx)
end

def plane_idx_to_take_off
    idx = []
    $mars_planes.each { |plane| idx << plane.name.gsub("Explorer ", "").to_i if plane.status == 'land' }
    idx
end

def take_off_plane_from_airport(plane_idx)
    begin
        check_index_valid(plane_idx, $mars_planes, "plane")
        airport = $mars_planes[plane_idx-1].airport
        airport.take_off($mars_planes[plane_idx-1])
    rescue => error
        puts error.message
        return false
    else
        puts "#{$mars_planes[plane_idx-1].name} took off from #{airport.name} airport"
        return true
    end
end

def check_index_valid(idx, arr, type)
    fail "Invalid #{type}" if idx > arr.count
    true
end

def build_airport
    capacity = Airport::DEFAULT_CAPACITY
    storm_probability = Airport::DEFAULT_STORM_PROBABILITY 
    loop do
        puts "please enter airport capacity (positive integer), enter 'd' to use default value #{capacity}"
        input = gets.chomp
        break if input.downcase == "d"
        if input.to_i > 0
            capacity = input.to_i
            break
        else
            puts "Invalid number, try again"
        end
    end

    loop do
        puts "please enter airport storm probability (between 0-1), enter 'd' to use default value #{storm_probability}"
        input = gets.chomp
        break if input.downcase == "d"
        if input.to_f >= 0 && input.to_f <= 1
            capacity = input.to_f
            break
        else
            puts "Invalid number, try again"
        end
    end

    airport = Airport.new(capacity, storm_probability)
    $mars_airports << airport
    puts "Built new airport #{airport.name}, capacity: #{airport.capacity}, storm_probability: #{airport.storm_probability}"
end

def add_plane
    $mars_planes << Plane.new
    puts "Added new plane #{$mars_planes[-1].name}"
end

def interactive_menu
    loop do
      # 1. print the menu and ask the user what to do
      print_menu
      # 3. do what the user has asked
      process(STDIN.gets.chomp)
    end
end

initialize_control
interactive_menu

# land_plane_on_airport(1,1)
# land_plane_on_airport(1,2)
# take_off_plane_from_airport(1)
# take_off_plane_from_airport(1)
# take_off_plane_from_airport(3)
# $mars_airports << Airport.new(0)
# $mars_airports << Airport.new(50)
# # print_airports
# # print_valid_airport
# print_planes
# print_plane_to_land


