require_relative 'errors/airport_full_error'
require_relative 'errors/bad_weather_error'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(weather_service, capacity = DEFAULT_CAPACITY)
    @weather_service = weather_service
    @capacity = capacity
    @planes_at_terminal = []
  end

  def land_plane(plane)
    begin
      check_landing_conditions(plane)
      @planes_at_terminal << plane
      :ok
    rescue => error
      "cannot land #{error.effected_plane}: #{error.message}"

    end 
  end

  def take_off(plane)
    begin
      raise BadWeatherError.new(plane) if weather_is_bad?
      @planes_at_terminal.delete(plane)
      :ok
    rescue => error
      "#{error.effected_plane} cannot take-off: #{error.message}"
    end 
  end

  def view_planes_at_terminal
    @planes_at_terminal
  end

  private 

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
