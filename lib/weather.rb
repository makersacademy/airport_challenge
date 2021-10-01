class Weather
  attr_reader :weather

  def initialize
  end

  def stormy?
    rand(1..4) == 4 ? true : false
  end
end
