class Weather
  DEFAULT = 10
  attr_reader :niceness

  def initialize niceness=DEFAULT
    @niceness = limit_to_range niceness.to_i  
  end

  def stormy?
    rand(niceness) == 0
  end

  private

  def limit_to_range number
    [number, 1, 100].sort[1]
  end
end
