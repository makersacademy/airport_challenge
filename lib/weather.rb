class Weather
  attr_reader :weather

  def initialize
    @stormy
  end

  def stormy?
    rand(1..4) == 4 ? @stormy = true : @stormy = false
  end
end
