class Weather

  attr_reader :weather

  def initialize
    @weather = rand(1..4)
  end

  def stormy?
    weather == 1
  end

end
