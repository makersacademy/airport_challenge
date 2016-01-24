require_relative 'plane'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY=40

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def landed_planes
    @landed_planes.dup
  end

  def clear_to_land(plane)
    fail 'The airport is full' if full?
    fail 'Stormy weather is preventing landing' if stormy?
    plane.land
    @landed_planes << plane
  end

  def clear_to_takeoff
    fail 'There are no planes at the airport' if empty?
    fail 'Stormy weather is preventing takeoff' if stormy?
    @landed_planes.each_with_index do |plane, i|
      return @landed_planes.delete_at(i)
    end
  end

  def confirm_landed(plane)
    plane.landed?
  end

  def stormy?
    rand(1..13) == 13 ? true:false
  end

  def full?
    @landed_planes.size >= capacity
  end

  def empty?
    @landed_planes.size <= capacity
  end







  # def clearance?
  #   true
  # end
  #
  # def plane_lands(plane)
  #   fail "Plane does not have clearance to land" if plane.clearance == false
  #   @landed_planes << plane
  # end
  #
  # def reset_clearance
  #   @landed_planes.each {|plane| plane.request_clearance(self)}
  # end

end
