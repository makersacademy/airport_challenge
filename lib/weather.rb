class Weather

  attr_reader :stormy

  STORMY = 1
  MOSTLY_SUNNY = 8

  def stormy?
    return @stormy = false unless rand(MOSTLY_SUNNY) == STORMY
    @stormy = true
  end

end
