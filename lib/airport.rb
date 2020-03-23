require './lib/weather'
require './lib/plane'

class Airport
  attr_reader :hangar, :weather, :hangar_capacity, :errors

  HANGAR_CAPACITY = 20

  def initialize(hangar_capacity = HANGAR_CAPACITY)
    @hangar = []
    @hangar_capacity = hangar_capacity
    @errors = {
      weather: 'inclement weather conditions prevent action',
      space: 'airport does not have sufficient space to land your plane',
      present: 'That plane is not in the airport',
      in_flight: 'cannot prepare for takeoff as plane is airborne',
      already: 'That plane is already docked at the airport',
      landed: 'plane is not airborne so cannot land plane'
    }
  end

  def land(plane)
    landing_checks(plane)
    plane.final_approach
    @hangar.push(plane)
  end

  def launch(plane)
    preflight_checks(plane)
    liftoff(plane)
  end

  def full?
    @hangar.length == @hangar_capacity
  end

  private
  def stormy?
    Weather.climate == :stormy
  end

  def weather_check
    raise @errors[:weather] if stormy?
  end

  def hangar_space_check
    raise @errors[:space] if full?
  end

  def landing_checks(plane)
    weather_check
    hangar_space_check
    transponder_check(plane)
  end

  def docked?(plane)
    @hangar.include?(plane)
  end

  def docked_check(plane)
    raise @errors[:present] unless docked?(plane)
    raise @errors[:in_flight] if plane.airborne
  end

  def transponder_check(plane)
    raise @errors[:already] if docked?(plane)
    raise @errors[:landed] unless plane.airborne
  end

  def preflight_checks(plane)
    docked_check(plane)
    weather_check
  end

  def liftoff(plane)
    plane.takeoff
    @hangar.delete_at(@hangar.index(plane))
  end
end
