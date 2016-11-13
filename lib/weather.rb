class Weather

  attr_reader :condition

  def initialize
    @condition = set_random_condition
  end

  def condition=(condition)
    @condition = condition
  end

  def get_random_number
    rand(1..10)
  end

  def determine_weather(number)
    number >= 7 ? set_condition_stormy : set_condition_sunny
  end

  def set_condition_stormy
    self.condition=(:stormy)
  end

  def set_condition_sunny
    self.condition=(:sunny)
  end

  def set_random_condition
    determine_weather(get_random_number)
  end

end
