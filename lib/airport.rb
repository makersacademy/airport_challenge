module Weather

  def current_weather(determiner = rand)
    determiner > 0.8 ? "bad" : "good"
  end

end

class Airport

  include Weather

  DEFAULT_CAPACITY = 100
  def initialize(code, planes = 0, capacity = DEFAULT_CAPACITY)
    @code = code.intern
    @capacity = capacity
    @planes = planes
    @plane_list = Array.new(capacity)
    0.upto(planes - 1) { |i| @plane_list[i] = Plane.new }
    0.upto(planes - 1) { |i| @plane_list[i].airport = code }
    @docklist = []
    @releaselist = []
    @planes = @plane_list.count { |a| a.is_a?(Plane) }
  end

  attr_reader :code, :capacity, :planes, :plane_list, :docklist, :releaselist
  attr_writer :plane_list, :docklist, :releaselist # only available for testing - would remove after

  def call_to_land(plane, weather = current_weather)
    raise "Not enough space for more planes" if @planes + @docklist.length >= @capacity
    raise "Plane is grounded" if plane.location != "flying"
    raise "Bad weather - landing not safe" unless weather == "good"
    plane.clear_for_action("land", @code)
    @docklist.push(plane)
    puts "Time to land"
  end

  def call_takeoff(plane, weather = current_weather)
    raise "Plane is not at this airport" if plane.airport != code
    raise "Bad weather - takeoff not safe" unless weather == "good"
    plane.clear_for_action("takeoff")
    @releaselist.push(plane)
    puts "Time to take-off"
  end

  def dock_planes
    docklist.each do |p|
      first_space = @plane_list.index(nil)
      @plane_list[first_space] = p if p.airport == code
    end
    docklist.clear
  end

  def release_planes
    @plane_list.map! do |p|
      next if p.nil?
      releaselist.include?(p) && p.airport != code ? nil : p
    end
    releaselist.clear
  end

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
