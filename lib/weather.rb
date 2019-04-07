class Weather

attr_accessor :weather

  def initialize
    @weather = rand(100)
  end

  def forecast
    @weather <= 90 ? "Sunny" : "Stormy"
  end

end
