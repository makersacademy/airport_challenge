class Weather 
  
  attr_accessor :weather

  def forecast
    @weather = rand > 0.75 ? :stormy : :sunny
  end

  def stormy?
    @weather == :stormy
  end
end

