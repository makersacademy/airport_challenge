class Weather
  attr_accessor :condition

  def initialize
    change
  end

  def change
    @condition = rand(1..100) <= 40 ? 'stormy' : 'sunny'
  end

  def stormy?
    @condition === 'stormy'
  end
end
