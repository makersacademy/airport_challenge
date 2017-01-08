require 'plane'
require 'weather_station'

class Airport
  attr_reader :weather_report, :capacity, :planes
  def initialize(weather_station, capacity = 20)
    @weather_report = weather_station.report
    @capacity = capacity
    @planes = []
  end
  def ask_to_land(plane)
    raise "Unable to land due to airport being full" if is_full?
    raise "Unable to land due to stormy weather" if is_stormy?
    planes << plane
  end
  def ask_to_take_off(plane)
    raise "Unable to take off due to stormy weather" if is_stormy?
    planes.delete(plane)
  end
  def has_landed?(plane)
    planes.include?(plane)
  end
  def has_taken_off?(plane)
    planes.include?(plane) == false
  end

  private

  def is_stormy?
    weather_report == 'stormy'
  end
  def is_full?
    planes.size == capacity
  end
end
