require_relative '../errors/airport_full_error'
require_relative '../errors/bad_weather_error'
require_relative '../errors/not_a_plane_error'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(weather_service, capacity = DEFAULT_CAPACITY)
    @weather_service = weather_service
    @capacity = capacity
    @planes_at_terminal = []
  end

  def land_plane(plane)
    raise NotAPlaneError.new(plane) if not_a_plane?(plane)
    begin
      check_landing_conditions(plane)
      @planes_at_terminal << plane
      :ok
    rescue => error
      "cannot land #{error.effected_plane.name}: #{error.message}"
    end 
  end

  def take_off(plane)
    pre_flight_checks(plane)
    begin
      raise BadWeatherError.new(plane) if weather_is_bad?
      @planes_at_terminal.delete(plane)
      :ok
    rescue => error
      "#{error.effected_plane} cannot take-off: #{error.message}"
    end 
  end

  def view_planes_at_terminal
    @planes_at_terminal.map { |plane| plane.id }
  end

  private

  def pre_flight_checks(plane)
    raise NotAPlaneError.new(plane) if not_a_plane?(plane)
    raise PlaneNotAtAirportError.new(plane) if plane_is_not_present?(plane)
  end
  
  def plane_is_not_present?(plane)
    find_plane(plane).empty?
  end

  def not_a_plane?(plane)
    plane.class != Aeroplane
  end

  def find_plane(plane_to_check)
    @planes_at_terminal.select { |stored_plane| stored_plane.id == plane_to_check.id }
  end

  def check_landing_conditions(plane)
    raise AirportFullError.new(plane) if airport_is_full?
    raise BadWeatherError.new(plane) if weather_is_bad?
  end

  def current_plane_count
    @planes_at_terminal.size
  end

  def airport_is_full?
    current_plane_count == @capacity
  end

  def weather_is_bad?
    @weather_service.weather_report == :storm
  end

end
