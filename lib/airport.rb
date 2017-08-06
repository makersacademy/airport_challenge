module Weather

  def current_weather(determiner = rand)
    determiner > 0.8 ? "bad" : "good"
  end

end

class Airport

  include Weather

  DEFAULT_CAPACITY = 100
  def initialize(code, planes, capacity = DEFAULT_CAPACITY)
    @code = code.intern
    @capacity = capacity
    @planes = planes
    @plane_list = Array.new(capacity)
    0.upto(planes - 1) { |i| @plane_list[i] = Plane.new }
  end

  attr_reader :code, :capacity, :planes, :plane_list

  def call_to_land(plane, weather = current_weather)
    raise "Plane is grounded" if plane.location != "flying"
    raise "Bad weather - landing not safe" unless weather == "good"
    plane.clear_for_action("land", @code)
    puts "Time to land"
  end

  def call_takeoff(plane, weather = current_weather)
    raise "Plane is not at this airport" if plane.airport != code
    raise "Bad weather - takeoff not safe" unless weather == "good"
    plane.clear_for_action("takeoff")
    puts "Time to take-off"
  end
  #
  # def dock_plane(plane)
  #   #to be called from plane if it lands
  #   #will add to plane_list
  # end
  #
  # def release_plane(plane)
  #   #to be called once plane's clear for action is true
  #   #will remove plane from plane list
  # end

end

class Plane

  def initialize
    @airport = nil
    @location = "grounded"
    @action_status = nil
  end
  attr_accessor :airport, :location
  attr_reader :action_status

  def clear_for_action(command, location = nil)
    if command == "land" && location != nil
      @action_status = location
    elsif command == "takeoff"
      @action_status = command
    else raise "Not a valid clearance command"
    end
    # allow action status to be "takeoff" or landing plus airport_id which enables landing
  end

  def land
    raise "Not clear for landing" unless @action_status != nil && @action_status.is_a?(Symbol)
    @airport = @action_status; @location = "grounded"; @action_status = nil
    # brings plane down safely if clear for action, changes location to grounded,
    # airport to airport and switches back action status
  end

  def take_off
    raise "Not clear for takeoff" unless @action_status == "takeoff"
    @airport = nil; @location = "flying"; @action_status = nil
    # plane takes off if clear for action, changes location to flying
    # and switches back action status to false
  end

end

#
# asdf=Airport.new(1)
# p asdf.singleton_class
