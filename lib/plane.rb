class Plane
  def initialize
    @forecast = forecast
  end

  def forecast
    forecast = rand(0..100)
  end
  
  def weather
    forecast >= 80 ? "Stormy" : "Sunny"
  end
end

