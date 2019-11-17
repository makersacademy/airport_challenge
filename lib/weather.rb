class Weather

  def initialize
    x = rand(1..10)
    if x == 10
      @weather = "stormy"
    else
      @weather = "sunny" 
    end
  end
  
  def stormy?
    if @weather == "stormy" 
      true
    else
      false
    end
  end

end
