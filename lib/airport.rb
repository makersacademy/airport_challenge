class Airport

  attr_accessor  :full, :capacity
  #:weather,
  DEFAULT_CAPACITY = 100

  def initialize (full = false, capacity = DEFAULT_CAPACITY)
    #weather = "sunny"
    #@weather = weather
    @full = full
    @capacity = capacity
  end

  def weather
    if rand(9) == 0
      @weather = "stormy"
    else
      @weather = "sunny"
    end
  end


end
