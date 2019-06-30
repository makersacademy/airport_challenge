

class Weather

  attr_reader :forecast

  def initialize
    @forecast = forecast?
  end

  def forecast?
    @forecast = 'Stormy'
  end

  def stormy?
    @forecast == 'Stormy'
  end

end
