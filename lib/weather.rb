class Weather

  def initialize
    @weather = 1
  end

  def weather_generator
    @weather = [1,1,1,2,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,2,1,1].sample

    if (@weather == 2)
      'stormy'
    else
      'sunny'
    end
  end
end
