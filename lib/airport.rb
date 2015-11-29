require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 1
attr_reader :default_capacity

def initialize(def_capacity = DEFAULT_CAPACITY)
  @default_capacity = def_capacity
  @planes = []
end

def  instruct_plane_to_land(landing_plane)
  full_airport_landing_refusal_check
  fail 'Plane has already landed' if
    landing_status_check(landing_plane) == 'Landed'
  fail 'Storm Warning : Cannot permit take off'/
    ' or landing' if weather_check == "stormy"
  landing_plane.plane_landing
  @planes << landing_plane
  landing_confirmation(landing_plane)
end

def instruct_plane_to_take_off(departing_plane)
  fail 'Plane is already in flight' if take_off_status_check(departing_plane)
  take_off_any_planes_check
  weather_check
  departing_plane.plane_taking_off
  @planes.delete(departing_plane)
  take_off_confirmation(departing_plane)
end

def weather_check
  Weather.new.weather_report
end

  private

  def full_airport_landing_refusal_check
    fail 'Airport full: Landing Denied' if @planes.
      length >= @default_capacity
  end

  def take_off_any_planes_check
    fail 'No Planes In Airport' if @planes.empty?
  end

  def take_off_status_check(departing_plane)
    true if departing_plane.
      instance_variable_get(:@plane_in_flight) == 'In-Flight'
  end

  def landing_status_check(landing_plane)
    true if landing_plane.
      instance_variable_get(:@plane_in_flight)  == 'Landed'
  end

  def landing_confirmation(landing_plane)
    puts "Plane: #{landing_plane} has landed."
  end

  def take_off_confirmation(departing_plane)
    puts "Plane: #{departing_plane} has departed."
  end

end
