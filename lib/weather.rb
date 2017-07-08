class Weather

  attr_accessor :weather

  def storms?
    r = Random.new
    @forecast = r.rand(0...100)
  end
end
