
class Weather
  attr_reader :condition

  def initialize
    update
  end

  def update
    @condition = rand(10)
  end

  def stormy?
    condition >= 8
  end
end
