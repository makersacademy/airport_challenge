class Weather
  attr_accessor :storm
  def initialize(storm = false)
    @storm = storm
  end
  def is_stormy?
    @storm
  end
end
