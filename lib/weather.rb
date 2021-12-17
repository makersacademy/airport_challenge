
class Weather
  attr_reader :weather

  def initialize(weather = :sunny)
    @weather = weather
    odds = rand(60)
    @weather = :stormy if odds == 13
  end

end
