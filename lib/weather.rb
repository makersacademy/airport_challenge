# Understands setting weather conditions
class Weather
  attr_reader :condition

  def initialize
    @condition = 'Sunny'
  end

  def stormy?
    condition == 'Stormy'
  end

  def change_condition
    rand(5) != 1 ? (@condition = 'Sunny') : (@condition = 'Stormy')
  end
end
