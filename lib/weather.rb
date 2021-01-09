class Weather

  def initialize(rng = Random.new)
    @rng = rng
  end

  def forecast
    @rng.rand(10) < 9 ? "sunny" : "stormy"
  end

end