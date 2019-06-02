class Weather
  def initialize(storm_level: 0)
    @storm_level = storm_level
  end

  def stormy?
    @storm_level >= 7
  end
end
