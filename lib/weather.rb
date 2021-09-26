class Weather
  attr_reader :status

  def initialize
    @status = random
  end

  def random
    # 10% chance of stormy weather
    rand(10).zero? ? @status = 'stormy' : @status = 'sunny'
  end

end
