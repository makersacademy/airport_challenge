class Weather

  attr_reader :condition

  def initialize
    @condition = ["clear", "stormy", "clear", "clear", "clear"].sample
  end

  def stormy
    @condition == "stormy"
  end
  
end
