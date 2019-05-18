require_relative 'random_weather_checker'

class Airport
  AIRPORT_AT_CAPACITY_ERROR = "The airport is full. Plane can not land."
  NOT_AT_AIRPORT_ERROR = 'This can not take off, it is not in the airport.'
  WEATHER_STORMY_ERROR = 'Plane cant take off due to stormy weather'

  attr_reader :landed, :capacity, :weather_checker

  def initialize(capacity, weather_checker)
    @landed = []
    @capacity = capacity
    @weather_checker = weather_checker
  end

  def land(flying_object)
    return AIRPORT_AT_CAPACITY_ERROR if at_capacity?

    return WEATHER_STORMY_ERROR if weather_checker.stormy?

    landed.push(flying_object)
    flying_object
  end

  def take_off(flying_object)
    NOT_AT_AIRPORT_ERROR unless landed.include?(flying_object)
  end

  private

  def at_capacity?
    landed.count >= capacity
  end
end
