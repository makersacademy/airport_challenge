class Weather

  attr_reader :stormy

  def initialize
    @stormy = storm_level
  end

  private

  def storm_level
  rand(11) > 7
  end

end
