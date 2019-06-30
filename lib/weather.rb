

class Weather

  attr_reader :forecast

  def initialize
    @forecast = forecast?
  end

  def forecast?
    rand(10) == 2 ? 'Stormy' : 'Sunny'
  end

  def stormy?
    @forecast == 'Stormy'
  end

end
