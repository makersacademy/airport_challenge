class Weather

  attr_reader :condition

  def initialize(condition = ["clear", "stormy",
    "clear", "clear", "clear"].sample)
    @condition = condition
  end

end
