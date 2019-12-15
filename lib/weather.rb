class Weather
  attr_accessor :weather

  def initialize
    @weather = rand(10)
  end

  def stormy?
    weather <= 3
  end
end
