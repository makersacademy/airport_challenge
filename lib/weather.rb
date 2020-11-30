class Weather
  attr_accessor :weather, :stormy
  
  def initialize
    @weather = rand(1..10)
    @stormy = stormy?
  end

  def stormy?
    false unless @weather >= 8
  end

end
