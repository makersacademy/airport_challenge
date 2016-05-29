require "weather"

class Plane
  SKY = Sky.new
  STORM_ERROR = "Stormy Weather" 
  BAD_COMMAND_ERROR = "Command does not make sense!" 

  attr_reader :position

  def initialize(weather = Weather.new)
    @position =  SKY
    @weather = weather
  end

  def land(airport)
    change_position(airport)
  end

  def take_off
    change_position(SKY)
  end 

  def landed?
    position.is_airport?
  end

  def new_weather(weather)
    @weather = weather
  end

  private
    def change_position(new_position)
      go_for_change?(new_position)
      enact_change(new_position)  
    end

    def go_for_change?(new_position)
      weather_ok_for_change?
      change_makes_sense?(new_position)
    end

    def enact_change(new_position)
      @position = new_position
      new_position.receive_plane(self)
    end
    
    def weather_ok_for_change?
      raise STORM_ERROR if @weather.stormy? 
    end

    def change_makes_sense?(new_position)
      raise BAD_COMMAND_ERROR if !new_position.is_airport?^landed? || !new_position.accept_plane?(self)
    end

end