# Weather Class, allows to check if it's stormy
class Weather

  def initialize(rng)
    @rng = rng
  end

  def stormy?(_airport)
    @rng.rand(100) > 90
  end

end
