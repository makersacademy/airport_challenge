class Sky
  attr_reader :weather

  def initialize
    @weather = generate_weather
  end

  def change_weather
    @weather = generate_weather
  end

  def generate_weather
    if rand(10) == 1
      :stormy
    else
      :sunny
    end
  end

  def stormy?
    @weather == :stormy
  end
end
