class Weather
  attr_accessor :condition

  def initialize
    change
  end

  def change
    @condition = rand(1..100) <= 3 ? 'stormy' : 'sunny'
  end

  def sunny?
    @condition === 'sunny'
  end

  def stormy?
    @condition === 'stormy'
  end
end