class Weather
  def initialize
    x = 10
    random = rand(1..x)
    if random == x # one in x chance of it being stormy.
      @storming = true
    else
      @storming = false
    end
  end

  def stormy?
    @storming
  end
end
