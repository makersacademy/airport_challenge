class Weather
  attr_accessor :storm
  def initialize(storm = false)
    @storm = storm
  end
  def stormy?
    storm_generator = rand(2)
    if (storm_generator == 0)
      @storm
    else
      @storm = false
    end
  end
end
