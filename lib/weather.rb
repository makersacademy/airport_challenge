class Weather

  attr_reader :condition
  
  def initialize(num = 8)
    @condition = num
  end

  def stormy?
    @condition == 8
  end
end
