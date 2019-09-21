class Weather
  
  def initialize
    update
  end

  def stormy?
    @storm
  end

  def sunny?
    @sunny
  end
   
  def update
    weather_id = rand(1..10)

    case 
    when weather_id < 8
      @storm = false
      @sunny = true
    when weather_id >= 8 && weather_id <= 10
      @storm = true
      @sunny = false
    end

  end
end
