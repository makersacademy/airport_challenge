class Weather

  attr_accessor :forecast

  def initialize
    @forecast = forecast
  end

  def stormy?
    @forecast = rand(0..100)
    p forecast
    if @forecast > 5
      false
    else
      true
    end
  end

end
