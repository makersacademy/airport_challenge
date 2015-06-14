class Weather

  def initialize 
    set_weather
  end

  def to_sym
    weather
  end

  private

  attr_accessor :weather

  def set_weather
    if rand > 0.7
      self.weather = :stormy
      puts "is stormy"
    else
      self.weather = :good
      puts "good weather"
    end
  end

end

