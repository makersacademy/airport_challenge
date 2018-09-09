require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 20
attr_reader :planes_arr
attr_accessor :capacity


  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_arr = []
  end

  def land(plane)
    #p plane.landed?
    fail 'Airport is full' if full?
    fail "Can't land because weather is stormy" if Weather.new.stormy?
    fail 'The plane is already landed' if plane.landed?
    plane.report_landed
    @planes_arr << plane
  end

  def take_off(plane)
    fail 'No planes available' if empty?
    fail "Can not take off weather is stormy" if Weather.new.stormy?
    fail "Can't take off already flying" if plane.takeoff?
    fail "Can't take off, plane is not in the airport" if @planes_arr.include?(plane) == false
    plane.confirm_takeoff
    @planes_arr.delete(plane)
    #.confirm?
    #plane.confirm?
  end

  private

  def full?
    @planes_arr.count >= @capacity
  end

  def empty?
    @planes_arr.empty?
  end

end
