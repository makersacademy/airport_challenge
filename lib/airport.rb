require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :airport_capacity, :flying, :planes
  MAXIMUM_CAPACITY = 30
  DEFAULT_CAPACITY = 20
  include Weather

  def initialize
    @airport_capacity ||= DEFAULT_CAPACITY
    @planes = []
  end

  def flying?
    if @flying == true
      return 'plane is flying'
    else
      return 'plane landed'
    end
  end

  def land(plane)
    if @stormy == true || full? == true
      return 'plane cannot land'
    else
      return 'plane can land'
      plane.land
      @planes << plane
    end
  end

  def take_off(plane)
    if @stormy == true
      return 'plane cannot take off'
    else
      return 'plane can take off'
      @planes.delete plane
    end
  end

  def full?
    if planes.count >= MAXIMUM_CAPACITY
      return 'true'
    else
      return 'false'
    end
  end
end
