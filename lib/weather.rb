class Weather
  STATES = [:sunny, :cloudy, :foggy, :stormy, :snowy, :windy, :clear]
  attr_reader :state

  def initialize
    @state = STATES.sample
  end

end
