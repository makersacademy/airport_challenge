class Weather

  def initialize(num = rand[1..10])
    @condition = num
  end

  def stormy?
    @condition == 8
  end
end
