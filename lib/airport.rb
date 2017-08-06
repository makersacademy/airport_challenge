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
    plane.status == "flying" ? (puts "Time to land") : (raise "Plane is grounded")
  end

  def call_to_take_off(plane)
    plane.airport == code ? (puts "Time to take-off") : (raise "Plane is not at this airport")
  end

  # def airport_ref
  #   return self
  # end

end

class Plane

  def initialize
    @airport = nil
    @status = "grounded"
  end
  attr_accessor :airport, :status

end
#
# asdf=Airport.new(1)
# p asdf.singleton_class
