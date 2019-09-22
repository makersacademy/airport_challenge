class Weather
  
  def initialize
    update
  end

  def stormy?
    return true if @weather_id > 8
    
    false
  end

  def update
    @weather_id = rand(1..10)
  end
end
