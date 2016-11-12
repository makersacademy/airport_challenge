class Weather

  attr_reader :condition

  def initialize
    @condition = get_random_condition
  end

  def condition=(condition)
    @condition = condition
  end

  def get_random_number
    rand(1..10)
  end

  def set_condition_stormy
    self.condition=(:stormy)
  end

  def set_condition_sunny
    self.condition=(:sunny)
  end

  def get_weather(integer)
    integer >= 7 ? set_condition_stormy : set_condition_sunny
  end

  def get_random_condition
    get_weather(get_random_number)
  end

end
