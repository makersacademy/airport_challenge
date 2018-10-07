class Weather

  def initialize(rng)
    @rng = rng
  end

  def stormy?
    @rng.rand(100) > 90
  end

end
