class Weather

  attr_reader :condition

  def initialize(condition)
    @condition = condition
  end

  def stormy?
    @condition == 8
  end
end
