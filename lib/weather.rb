class Weather

  attr_accessor :storm

  def initialize(storm = false)
    @storm = storm
  end

  def stormy?
    storm_generator == 0 ? @storm = true : @storm = false
    @storm
  end

  def storm_generator
    rand(2)
  end
  
end
