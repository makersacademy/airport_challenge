class Weather
  attr_reader :weather
  def initialize
    rand(4) > 2 ? @weather = 'stormy' : @weather = 'sunny'
  end
end
