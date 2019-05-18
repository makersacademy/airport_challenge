class Plane
  BAD_WEATHER_MESSAGE = "I can't do that, the weather is stormy!"
  NOT_AT_AIRPORT_MESSAGE = "I'm not at that airport!"
  ALREADY_AT_AIRPORT_MESSAGE = "I'm already at an airport!"
  ALREADY_IN_AIR_MESSAGE = "I'm already in the air!!"
  CAPACITY_MESSAGE = "I can't land there, the airport is full! Better hope there's another airport nearby!"

  def initialize(state = :flying)
    @state = state
  end

  def land(airport)
    return ALREADY_AT_AIRPORT_MESSAGE if @state == :landed
    case airport.cleared_for_landing?(self)
    when :weather
      return BAD_WEATHER_MESSAGE
    when :capacity
      return CAPACITY_MESSAGE
    when true
      landing_procedure(airport)
    end
  end

  def take_off(airport)
    return ALREADY_IN_AIR_MESSAGE if @state == :flying
    case airport.cleared_for_takeoff?(self)
    when :weather
      return BAD_WEATHER_MESSAGE
    when :not_in_airport
      return NOT_AT_AIRPORT_MESSAGE
    when true 
      takeoff_procedure(airport)
    end
  end

  private

  def landing_procedure(airport)
    airport.receive(self)
    @state = :landed 
    return "Plane landed at #{airport.name} (#{airport.code})"
  end

  def takeoff_procedure(airport)
    airport.release(self)
    @state = :flying
    return "Plane took off from #{airport.name} (#{airport.code})"
  end
end