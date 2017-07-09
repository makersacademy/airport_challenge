class Weather

  attr_accessor :weather

  def storms?
    r = Random.new
    @forecast = r.rand(0...100)
    return true if @forecast % 2 == 0
    return false if @forecast
  end
end
