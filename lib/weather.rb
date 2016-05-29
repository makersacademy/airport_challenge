class Weather
  attr_accessor :storm
  def initialize(storm = false)
    @storm = storm
  end
  def stormy?
    @storm
  end
end
