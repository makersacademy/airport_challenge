require_relative 'plane'
require_relative 'weather'
class Airport
  attr_reader :hangar, :plane, :weather

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    @hangar << plane
  end

  def take_off(plane)
    fail 'Take off cancelled due to bad weather' if @weather.stormy? == true
    @hangar.delete(plane)
    status
  end

  def status
    if @hangar.count < 2
      "#{@hangar.count} plane at the airport"
    else
      "#{@hangar.count} planes at the airport"
    end
  end
end
