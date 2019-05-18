class Plane
  BAD_WEATHER_MESSAGE = "I can't do that, the weather is stormy!"
  NOT_AT_AIRPORT_MESSAGE = "I'm not at that airport!"
  ALREADY_AT_AIRPORT_MESSAGE = "I'm already at an airport!"

  def initialize(state = :flying)
    @state = state
  end

  def land(airport)
    if @state == :flying
      case airport.cleared_for_landing?(self)
      when :weather
        return BAD_WEATHER_MESSAGE
      when true
        airport.receive(self)
        @state = :landed 
        return "Plane landed at #{airport.name} (#{airport.code})"
      end
    else
      return ALREADY_AT_AIRPORT_MESSAGE
    end
  end

  def take_off(airport)
    case airport.cleared_for_takeoff?(self)
    when :weather
      return BAD_WEATHER_MESSAGE
    when :not_in_airport
      return NOT_AT_AIRPORT_MESSAGE
    when true 
      airport.release(self)
      @state = :flying
      return "Plane took off from #{airport.name} (#{airport.code})"
    end
  end
end