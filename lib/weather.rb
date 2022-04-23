class Weather
  attr_accessor :weather
  def initialize
    rand_num = rand(10)
    rand_num < 3 ? @weather = 'stormy' : @weather = 'sunny'
  end
end
