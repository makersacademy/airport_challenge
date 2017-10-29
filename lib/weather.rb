class Weather

  attr_reader :storm_chance

  STORM_DANGER=0.9

  def initialize()
    @storm_chance=rand
  end

  def stormy?
    @storm_chance>STORM_DANGER
  end

end
