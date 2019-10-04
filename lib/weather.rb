class Weather
  DEFAULT_WEATHER = ['stormy', 'sunny']
  attr_accessor :status
  def initialize
    rand_num = rand(0..1)
    @status = DEFAULT_WEATHER[rand_num]
  end
end
