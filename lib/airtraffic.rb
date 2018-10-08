require './lib/plane'

class Airtraffic
  def initialize
    @weather = rand(0..1)
  end

  def target_destination(plane, destination)
    plane.receive_target(destination)
  end

  def safe_conditions
    if @weather.zero?
      true
    else
      false
    end
  end

  def clear_for_take_off(plane)
    plane.take_off
  end

  def safely_in_flight(plane)
    plane.successful_take_off?
  end
end
