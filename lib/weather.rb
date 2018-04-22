class Weather

  attr_reader :condition

  def initialize(condition = [
    "clear",
    "stormy",
    "clear",
    "clear",
    "clear"
  ])
    @condition = condition.sample
  end

end
