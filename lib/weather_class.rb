class Weather
  attr_accessor :weather

  def initialize
    rand(2) == 0 ? @weather = 'stormy' : @weather = 'calm'
  end
end
