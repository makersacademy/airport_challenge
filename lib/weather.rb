class Weather

  attr_reader :current_state

  def random_weather
    if rand(20) == 19 # simulates a 5% chance of storm
      return :stormy
    else
      return :good
    end
  end

  def initialize
    @current_state = random_weather
  end

  def safe?
    @current_state == :good
  end

end
