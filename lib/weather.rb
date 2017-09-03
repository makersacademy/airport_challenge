class Weather
  attr_reader :chance_of_storm
  CHANCE_OF_STORM = 10

  def initialize(chance_of_storm = CHANCE_OF_STORM)
    @chance_of_storm = chance_of_storm
    @stormy = (rand(100) <= CHANCE_OF_STORM)
  end

  def stormy?
    stormy
  end

  private
  attr_reader :stormy

end
