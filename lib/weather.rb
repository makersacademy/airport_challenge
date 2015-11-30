class Weather
  attr_reader :stormy

  def initialize
    if rand(10) == 4
      @stormy = true
    else
      @stormy = false
    end
  end
end
