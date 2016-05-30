class Weather
  attr_reader :weather

  def initialize
    if rand(10) < 4
      @weather = "Sunny"
    else
      @weather = "Stormy"
    end
  end

end