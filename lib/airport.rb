require_relative './weather.rb'
require_relative './plane.rb'
require_relative './air.rb'
require_relative './air_control.rb'

class Airport
  attr_accessor :capacity, :planes
  attr_reader :name

  DEFAULT_CAPACITY = 50

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @name = name
  end

  def from_factory(*plane, airport_control)
    if full?
      full_capacity_msg
    else
      add(*plane, airport_control)
    end
  end

  def land(plane, airspace, airport_control)
    if plane_at_airport(plane)
      double_land_error(plane)
    elsif !plane_at_airspace(plane, airspace)
      not_in_airspace_error(plane, airspace)
    elsif full?
      print "Landing will not proceed as "
      full_capacity_msg
    elsif storm
      print "Landing "
      storm_announcement(plane)
    else
      success_land(plane, airspace, airport_control)
    end
  end

  def takeoff(plane, airspace, airport_control)
    if !plane_at_airport(plane)
      misssing_plane_error(plane)
    elsif plane_at_airspace(plane, airspace)
      in_airspace_error(plane, airspace)
    elsif storm
      print "Takeoff "
      storm_announcement(plane)
    else
      success_takeoff(plane, airspace, airport_control)
    end
  end

private
  def in_airspace_error(plane, airspace)
    raise "Plane #{plane.name} is already flying in #{airspace.name.capitalize}'s airspace.  Takeoff will not proceed."
  end

  def not_in_airspace_error(plane, airspace)
    raise "Landing will not proceed as plane #{plane.name} is currently not in #{airspace.name.capitalize}'s airspace."
  end

  def full_capacity_msg
    puts "#{@name.capitalize} is at its full capacity.  Please try again later."
  end

  def double_land_error(plane)
    raise "Plane #{plane.name} has already landed at #{@name}."
  end

  def misssing_plane_error(plane)
    raise "Plane #{plane.name} is not in #{@name}. Takeoff will not proceed."
  end

  def add(*plane, airport_control)
    plane.each do |x|
      @planes << [x, x.name]
      airport_control.planes << { plane: x, airport: @name, airspace: "nil" }
    end
  end

  def check_weather
    Weather.new.check_weather
  end

  def storm
    check_weather == "stormy"
  end

  def plane_at_airport(plane)
    @planes.include? [plane, plane.name]
  end

  def plane_at_airspace(plane, airspace)
    airspace.planes.include? [plane, plane.name]
  end

  def full?
    @planes.count == @capacity
  end

  def success_land(plane, airspace, airport_control)
    add(plane, airport_control)
    airspace.planes.delete([plane, plane.name])
    airport_control.planes.reject! { |x| x[:plane] == plane }
    airport_control.planes << { plane: plane, airport: @name, airspace: "nil" }
    puts "Sunny weather on #{Time.now}."
    puts "#{plane.name} has landed at #{@name}."
  end

  def success_takeoff(plane, airspace, airport_control)
    airspace.planes << [plane, plane.name]
    @planes.delete([plane, plane.name])
    airport_control.planes.reject! { |x| x[:plane] == plane }
    airport_control.planes << { plane: plane, airport: "nil", airspace: airspace.name }
    puts "Sunny weather on #{Time.now}."
    puts "Takeoff of plane #{plane.name} is successful."
    puts "It is current flying in #{airspace.name.capitalize}'s airspace."
  end

  def storm_announcement(plane)
    puts "of plane #{plane.name} will not proceed due to stormy weather conditions."
    puts "Please try again when weather has improved."
  end
end

=begin
require './lib/airport'
airport1=Airport.new("Heathrow")
plane1=Plane.new("CX255")
plane2=Plane.new("BA001")
plane3=Plane.new("MN323")
can=Air.new("canada")
airport1.from_factory(plane1,plane2,plane3)
chi=Air.new("china")
central_control=AirControl.new
airport1.takeoff(plane1,can, central_control)
plane1.status(central_control)
airport1.land(plane1,can,central_control)

# def empty?
#   @planes.count.zero?
# end
=end
