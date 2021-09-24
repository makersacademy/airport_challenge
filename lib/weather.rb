class Weather

  def initialize
    random_weather
  end

  def random_weather
    @weather = ""
    rand = rand(10)

    if rand.eql? 1  or rand.eql? 2
      @weather << "stormy"
    else
      @weather << "sunny"
    end

  end

  def get_weather_status
    @weather
  end

  def weather_stormy?
    if @weather << "stormy"
      true
    elsif @weather << "sunny"
      false
    end


  end
end
