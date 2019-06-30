

class Weather

  attr_reader :forecast

  def initialize
    @forecast = forecast?
  end

  def forecast?
    random = rand(10)
    if random == 2
      'Stormy'
    else
      'Sunny'
    end
  end

  def stormy?
    @forecast == 'Stormy'
  end

end
