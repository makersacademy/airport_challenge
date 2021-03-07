require './lib/airport'
require './lib/plane'

$mars_airports = []
$mars_planes = []
DIVIDE_LINE_LEN = 80

# ------------------------------------------------------
# Main procedures
# ------------------------------------------------------
def initialize_control
  # first airport (default 10 planes capacity)
  $mars_airports << Airport.new
  # 15 planes
  15.times { $mars_planes << Plane.new }
end

def interactive_menu
  loop do
    # print the menu and ask the user what to do
    print_menu
    # do what the user has asked
    process(gets.chomp)
    # let user choose to proceed to next
    puts "press any key to return to menu"
    gets.chomp
  end
end

# ------------------------------------------------------
# Menu
# ------------------------------------------------------
def print_menu
  print_banner
  puts "*" * DIVIDE_LINE_LEN
  puts "Menu (select a number listed below to operate)"
  puts "-" * DIVIDE_LINE_LEN
  print_menu_items
  puts "*" * DIVIDE_LINE_LEN
  2.times { puts "" }
end

def print_menu_items
  puts "1. Show airport(s) information"
  puts "2. Show plane(s) information"
  puts "3. Land a plane"
  puts "4. Take off a plane"
  puts "5. Build an airport"
  puts "6. Add a plane"
  puts "7. Exit"
end

def print_banner
  banner = File.read("docs/banner.txt")
  puts banner
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

# ------------------------------------------------------
# 1. Show airport(s) information
# ------------------------------------------------------
def print_airports
  puts "-" * DIVIDE_LINE_LEN
  puts "Martian Airports"
  puts "-" * DIVIDE_LINE_LEN
  $mars_airports.each { |airport| puts "Airport: #{airport.name}, Capacity: #{airport.capacity}, Storm Probability: #{airport.storm_probability}" }
  2.times { puts "" }
end

# ------------------------------------------------------
# 2. Show plane(s) information
# ------------------------------------------------------
def print_planes
  puts "-" * DIVIDE_LINE_LEN
  puts "Martian Planes"
  puts "-" * DIVIDE_LINE_LEN
  $mars_planes.each { |plane| puts "Plane: #{plane.name}, Status: #{plane.status} #{plane.airport.name unless plane.airport.nil?}" }
  2.times { puts "" }
end

# ------------------------------------------------------
# 3. Land a plane
# ------------------------------------------------------
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
    rescue => e
      puts e.message
    end
    planes_idx.include?(plane_idx) ? break : (puts "Invalid number, try again")
  end

  loop do
    puts "Airports has capacity to land: #{airports_idx.join(",")}"
    puts "Select a airport number to land"
    begin
      airport_idx = gets.chomp.to_i
    rescue => e
      puts e.message
    end
    airports_idx.include?(airport_idx) ? break : (puts "Invalid number, try again")
  end

  puts "-" * DIVIDE_LINE_LEN
  puts "Please try again later" unless land_plane_on_airport(airport_idx, plane_idx)
  puts "-" * DIVIDE_LINE_LEN
  2.times { puts "" }
end

# airport with spare capacity
def valid_airport_idx
  idx = []
  $mars_airports.each { |airport| idx << airport.name.gsub("Colony ", "").to_i if airport.capacity.positive? }
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
    $mars_airports[airport_idx - 1].land($mars_planes[plane_idx - 1])
  rescue => e
    puts e.message
    return false
  else
    puts "#{$mars_planes[plane_idx - 1].name} landed at #{$mars_airports[airport_idx - 1].name} airport"
    return true
  end
end

# ------------------------------------------------------
# 4. Take off a plane
# ------------------------------------------------------
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
    rescue => e
      puts e.message
    end
    planes_idx.include?(plane_idx) ? break : (puts "Invalid number, try again")
  end

  puts "-" * DIVIDE_LINE_LEN
  puts "Please try again later" unless take_off_plane_from_airport(plane_idx)
  puts "-" * DIVIDE_LINE_LEN
  2.times { puts "" }
end

def plane_idx_to_take_off
  idx = []
  $mars_planes.each { |plane| idx << plane.name.gsub("Explorer ", "").to_i if plane.status == 'land' }
  idx
end

def take_off_plane_from_airport(plane_idx)
  begin
    check_index_valid(plane_idx, $mars_planes, "plane")
    airport = $mars_planes[plane_idx - 1].airport
    airport.take_off($mars_planes[plane_idx - 1])
  rescue => e
    puts e.message
    return false
  else
    puts "#{$mars_planes[plane_idx - 1].name} took off from #{airport.name} airport"
    return true
  end
end

# ------------------------------------------------------
# Shared function for 3 and 4
# ------------------------------------------------------

def check_index_valid(idx, arr, type)
  fail "Invalid #{type}" if idx > arr.count

  true
end

# ------------------------------------------------------
# 5. Build an airport
# ------------------------------------------------------
def build_airport
  capacity = Airport::DEFAULT_CAPACITY
  storm_probability = Airport::DEFAULT_STORM_PROBABILITY 
  loop do
    puts "please enter airport capacity (positive integer), enter 'd' to use default value #{capacity}"
    input = gets.chomp
    break if input.downcase == "d"

    if input.to_i.positive?
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
      storm_probability = input.to_f
      break
    else
      puts "Invalid number, try again"
    end
  end

  airport = Airport.new(capacity, storm_probability)
  $mars_airports << airport
  puts "-" * DIVIDE_LINE_LEN
  puts "Built new airport #{airport.name}, capacity: #{airport.capacity}, storm_probability: #{airport.storm_probability}"
  puts "-" * DIVIDE_LINE_LEN
  2.times { puts "" }
end

# ------------------------------------------------------
# 6. Add a plane
# ------------------------------------------------------
def add_plane
  $mars_planes << Plane.new
  puts "-" * DIVIDE_LINE_LEN
  puts "Added new plane #{$mars_planes[-1].name}"
  puts "-" * DIVIDE_LINE_LEN
  2.times { puts "" }
end

# ------------------------------------------------------
# Main
# ------------------------------------------------------
initialize_control
interactive_menu
