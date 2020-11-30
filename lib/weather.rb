class Weather
  attr_accessor :weather, :stormy
  
  def initialize
    @weather = rand(1..10)
    @stormy = stormy?
  end

  def stormy?
    if @weather > 8
      true
    else
      false
    end
  end
  
end
