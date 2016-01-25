class Airport
  CAPACITY = 100

  attr_accessor :weather

  def initialize
    @weather = weather_update
  end

  private

  def weather_update
    rand(5) == 0 ? 'stormy' : 'sunny'
  end
end