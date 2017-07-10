class Weather

  attr_accessor :weather

  def storms?
    r = Random.new
    @forecast = r.rand(0...100)
    (@forecast % 2).zero?
  end
end
