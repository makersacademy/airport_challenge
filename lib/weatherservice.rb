class Weatherservice

  def initialize (random=Random.new)
    @random = random
  end

  def weather
    @random.rand(10) == 5 ? "stormy" : "sunny"
  end

end