class Weather
attr_reader :weather

def initialize
  @weather = weather
end

  def forecast
    rand(0..5) == 5 # stormy when 5
  end
end