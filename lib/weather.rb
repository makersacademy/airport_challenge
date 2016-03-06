class Weather  

  attr_reader :stormy
  def initialize
    @stormy = calculate_weather
  end

  def random_num
    rand(6) 
  end

  def calculate_weather
    random_num == 5
  end

    
end
