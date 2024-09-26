class Weather

  attr_reader :condition

  def initialize(condition = rand(1..10))
    @condition = condition
  end

  def stormy?
    @condition == 8
  end
end
