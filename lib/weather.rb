class Weather

  def initialize
    @prng = Random.new
  end

  def stormy?
    @prng.rand(1..4) == 4
  end
end