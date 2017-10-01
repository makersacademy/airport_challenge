class Airport
  require 'weather'

  attr_reader :capacity, :landed_airplanes

  def initialize(capacity = 500)
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
