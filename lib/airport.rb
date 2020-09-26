require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :capacity
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @plane = []
    @@hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    hangar_full(plane)
    # fail "No hangar space available" if hangar_full(plane)
  end

  def takeoff(plane)
    check_weather("takeoff")
    # @@hangar.pop
  end

  def checkHangar
    @@hangar
  end

  def check_weather(action)
    stormy = 2
    if @weather.generate == stormy
      raise "cannot #{action} due to stormy weather"
    else
      @@hangar.pop
      return "perfect for flying"
    end
  end

  private

  def hangar_full(plane)
    if @@hangar.length >= capacity
      raise "No hangar space available"
    elsif
      @@hangar.include?(plane)
      raise "plane already landed"
    else
      @@hangar << plane
    end
  end

end