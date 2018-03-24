class Weather

  WEATHER_STATES = [:stormy, :rainy, :sunny, :windy, :foggy, :overcast, :snowy]
  attr_accessor :states
  attr_accessor :current_state

  def initialize
    @states = WEATHER_STATES
    @current_state = states.sample
  end

  def stormy?
    @current_state == :stormy
  end

end
