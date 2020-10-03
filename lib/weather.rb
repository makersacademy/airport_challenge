class Weather

  def initialize(num = rand[1..10])
    @condition = num
  end

  def stormy?
    return true if @condition == 8
    false
  end
end
