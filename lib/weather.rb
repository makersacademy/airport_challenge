class Weather

  def initialize(weathers = [:stormy, :fine, :fine, :fine, :fine])
    @weathers = weathers
  end

  def stormy?
    weather == :stormy
  end

  private

  def weather
    @weathers.sample
  end
end
