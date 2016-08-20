class Weather

  attr_reader :stormy

  def initialize
    @stormy = storm_level
  end

  def storm_level
  rand(11)>1 ? @stormy = true : @stormy = false
  end

end
