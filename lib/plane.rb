require "weather"

class Plane
  SKY = Sky.new.freeze
  STORM_ERR_MSG = "Stormy Weather" 
  BAD_CMD_ERR_MSG = "Command does not make sense!" 

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
    def change_position(new_pos)
      enact_change(new_pos) if go_for_change?(new_pos)
    end

    def go_for_change?(new_pos)
      weather_ok_for_change?
      change_makes_sense?(new_pos)
      new_pos.accept_plane?(self)
    end

    def enact_change(new_pos)
      @position = new_pos
      new_pos.receive_plane(self)
    end
    
    def weather_ok_for_change?
      fail STORM_ERR_MSG if @weather.stormy? 
    end

    def change_makes_sense?(new_pos)
      it_makes_sense = new_pos.is_airport?^landed?
      fail BAD_CMD_ERR_MSG unless it_makes_sense
    end

end