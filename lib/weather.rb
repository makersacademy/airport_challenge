class Weather  

  attr_reader :stormy
  def initialize
    calculate_weather
  end


private
  def random_num
    rand(6) 
  end

  def calculate_weather
    @stormy = (random_num == 5)
  end    
end
