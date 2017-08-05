require "weather"

class Plane
  SKY = NoAirport.new.freeze
  STORM_ERR_MSG = "Stormy Weather".freeze
  BAD_CMD_ERR_MSG = "Command does not make sense!".freeze

  attr_reader :position

  def initialize(weather = Weather.new, position = SKY)
    @position =  position
    @weather = weather
  end

  def land(airport)
    change_position(airport)
  end

  def take_off(new_sky = SKY)
    change_position(new_sky)
  end 

  def landed?
    position.on_ground?
  end

  def new_weather(weather)
    @weather = weather
  end

  private

  def change_position(new_pos)
    @position = new_pos if check_change?(new_pos)
    new_pos.receive_plane(self)
  end

  def check_change?(new_pos)
    fail STORM_ERR_MSG if @weather.stormy? 
    fail BAD_CMD_ERR_MSG unless new_pos.on_ground?^@position.on_ground?
    new_pos.accept_plane?(self)
  end

end