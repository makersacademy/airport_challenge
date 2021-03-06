require 'plane'
require 'weather'
require 'safe_weather'
require 'safety_breach'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :name, :capacity, :weather, :safety_status
  attr_reader :planes

  def initialize(
    name = 'Schiphol',
    capacity = DEFAULT_CAPACITY,
    weather = Weather.new(0, 2, 10),
    safety_status = SafetyBreach.new([1, 2, 3, 4, 5, 6, 7, 8])
  )
    @name = name
    @planes = []
    @capacity = capacity
    @weather = weather
    @safety_status = safety_status

  end

  def change_capacity(capacity)
    @capacity = capacity
  end

  def safety_breach
    @safety_check_result = @safety_status.safety_assesment
    terrorist_protocol
  end

  def terrorist_protocol
    @safety_check_result.include?('terrorist')
  end

  def arrive(plane)
    fail 'This airport is in a quarantaine situation, no access.' if safety_breach
    fail 'Airport is at max capacity.' if full?
    fail 'It is not safe to land here at the moment.' unless SafeWeather.safety_check(weather)

    arriving_planes(plane)
  end

  def depart(plane)
    fail 'This airport is in a quirantaine situation, no planes can leave.' if safety_breach
    fail 'There are no planes at your disposal.' if empty?
    fail 'It is not safe to depart at the moment.' unless SafeWeather.safety_check(weather)

    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

  private

  def arriving_planes(plane)
    @planes << plane
  end

end
