class Weather
  def initialize
    random = rand(1..10)
    if random == 10 # one in ten chance of it being stormy.
      @storming = true
    else
      @storming = false
    end
  end

  def stormy?
    @storming
  end
end
