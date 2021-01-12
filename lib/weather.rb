class Weather 

  attr_reader :weather

  # 1 in 10 chance weather is stormy
  def initialize
    @weather = rand(1..10)
  end

  def stormy?
    weather == 10
  end
end
