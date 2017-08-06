class Airport

  DEFAULT_CAPACITY = 100
  def initialize(code, planes, capacity = DEFAULT_CAPACITY)
    @code = code
    @capacity = capacity
    @planes = planes
    @plane_list = Array.new(capacity)
    0.upto(planes - 1) { |i| @plane_list[i] = Plane.new }
  end

  attr_reader :code, :capacity, :planes, :plane_list

  def call_to_land(plane)
    plane.location == "flying" ? (puts "Time to land") : (raise "Plane is grounded")
    #want to add break clause if bad weather
    #also want plane to register this call, possibly by registering airport code in action_status
  end

  def call_to_take_off(plane)
    plane.airport == code ? (puts "Time to take-off") : (raise "Plane is not at this airport")
    #want to add break clause if bad weather
    #also want plane to register this call if sent
  end
  #
  # def dock_plane
  #   #to be called from plane if it lands
  #   #will add to plane_list
  # end
  #
  # def release_plane
  #   #to be called from plane if it takes off
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

  # def clear_for_action
  #   #allow action status to be true which enables landing
  # end
  #
  # def land
  #   #brings plane down safely if clear for action, changes location to grounded and switches back action status
  # end
  #
  # def take_off
  #   #plane takes off if clear for action, changes location to flying and switches back action status to false
  # end

end
#
# asdf=Airport.new(1)
# p asdf.singleton_class
