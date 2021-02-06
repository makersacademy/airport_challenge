class Airport
  attr_reader :planes, :title, :weather

  def initialize(title = "Unnamed Airport", planes = [], weather = "sunny")
    @title = title
    @planes = planes
    @weather = weather
  end

  def weather_fetcher
    if rand(1..10).between?(1,8)
      @weather = "sunny"
      return @weather
    else
      @weather = "stormy"
      return @weather
    end
  end

  def weather?
    weather_fetcher
    if @weather == "sunny"
      true
    else
      false
    end
  end

end
