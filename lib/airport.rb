class Airport
  require File.dirname(__FILE__) + '/weather'

  attr_reader :capacity, :landed_airplanes
  DEFAULT_CAPACITY = 500

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_airplanes = []
  end

  def request_to_land(plane)
    unless prevent_landing
      @landed_airplanes << plane 
      return true
    end
    false
  end

  def request_to_take_off(plane)
    unless prevent_take_off
      @landed_airplanes.delete(plane)
      return true
    end
    false
  end

  private

  def full?
    landed_airplanes.count == capacity 
  end

  def prevent_take_off
    stormy? 
  end

  def prevent_landing
    stormy? || full?
  end

  def stormy?
    Weather.report == "stormy"
  end

end
