require './lib/weather'
require './lib/airplane'

class Airport

  attr_accessor :current_capacity
  attr_reader :airplanes

  def initialize(capacity = 20, weather = Weather.new)
    @current_capacity = capacity
    @airplanes = []
    @weather = weather
  end

  def show_status_of_airplanes
    "Grounded: #{check_number_of_grounded_planes}, Airborne: #{check_number_of_airborne_planes}"
  end

  def instruct_airplane_to_land
    fail "Permission to land denied" unless @weather.sunny? && !at_capacity?
    @airplanes << Airplane.new.land
  end

  def instruct_airplane_to_take_off
    fail "Permission to take off denied" unless @weather.sunny?
    @airplanes << first_grounded_airplane.take_off
  end

  def at_capacity?
    check_number_of_grounded_planes >= @current_capacity
  end

  private

  def first_grounded_airplane
    first_grounded_airplane = @airplanes.find do
      |airplane| airplane.current_status == :grounded
    end
    @airplanes.delete_if do
      |target_airplane| target_airplane == @airplanes.find do
        |airplane| airplane.current_status == :grounded
      end
    end
    first_grounded_airplane
  end

  def check_number_of_grounded_planes
    @airplanes.count { |airplane| airplane.current_status == :grounded }
  end

  def check_number_of_airborne_planes
    @airplanes.count { |airplane| airplane.current_status == :airborne }
  end
end
