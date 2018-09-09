require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 20
attr_reader :planes_arr, :weather
attr_accessor :capacity


  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @planes_arr = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'The plane is already landed' if plane.landed?
    # if @weather.condition == 'sunny'
    #   plane.report_landed
    #   @planes_arr << plane
    # elsif
    #   @weather.condition == 'stormy'
    #     "Sorry! Plane can not take off due to bad weather condition"
    #   end
    plane.report_landed
    @planes_arr << plane
  end

  def take_off(plane)
    #fail 'No planes available' if empty? && planes_arr.include?(plane) == false
    fail "Can't take off already flying" if plane.takeoff?
    #fail "Can't take off, plane is not in the airport" if @planes_arr.include?(plane) == false && !empty?
    if @weather.condition == 'sunny'
      plane.confirm_takeoff
      @planes_arr.delete(plane)
    elsif @weather.condition == 'stormy'
      "Sorry! Plane can not take off due to bad weather condition"
    end

  end

  private

  def full?
    @planes_arr.count >= @capacity
  end

  def empty?
    @planes_arr.empty?
  end

end
