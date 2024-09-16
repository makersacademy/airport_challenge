class Weather 
  
  attr_reader :stormy
  
  def initialize
    @stormy = false
  end

  def storm?
    rand(10)==0
  end

  def update_weather
    if storm?
      @stormy = true
    else
      @stormy = false
    end
  end
end