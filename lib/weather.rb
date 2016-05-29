class Weather

  def initialize
    summer
  end

  def is_stormy?
    weather.sample
  end

  def summer
    self.weather = [false,false,false,false,true]
  end

  def winter
    self.weather = [true,true,true,true,false]
  end

  def blizzard
    self.weather = [true,true,true,true,true]
  end


  private

  attr_accessor :weather

end
