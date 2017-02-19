class Weather

  def initialize
    @weather = 1
  end

  def stormy?(weather=@weather)
    if (weather == 2)
      true
    else
      false
    end
  end

  def weather_generator
    @weather = [1,1,1,1,1,1,2,1,1].sample
  end
end
