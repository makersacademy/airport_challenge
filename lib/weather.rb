class Weather
attr_accessor :weather

  def initialize #upon initalizing it is given random weather 1/6 chance of storm
    num = rand(0...5) #change this for definitive weather
    if num == 0 || num == 1 || num == 2 || num == 3 || num == 4
      @weather = 'clear'
    elsif num == 5
      @weather = 'stormy'
    end
  end


  def clear?
    if @weather == 'clear'
      return true
    elsif @weather == 'stormy'
      return false
    end
  end

end
