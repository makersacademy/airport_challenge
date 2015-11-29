class Weather
  DEFAULT = 10
  attr_reader :niceness

  def initialize niceness=DEFAULT
    @niceness = limit niceness.to_i  
  end

  def stormy?
    rand(niceness) == 0
  end

  private

  def limit number
    [number, 1, 100].sort[1]
  end
end
