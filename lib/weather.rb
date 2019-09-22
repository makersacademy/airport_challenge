class Weather

  def initialize
    random = rand(1..10)
    if random == 2
      @stormy = true
    else
      @stormy = false
    end
  end

  def stormy?
    @stormy
  end

end
