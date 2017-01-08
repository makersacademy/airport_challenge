class Weather
  attr_accessor :random_weather, :stormy
  def stormy?
    @stormy = random_weather(rand_num)
  end

  def random_weather(random_number)
    if random_number > 9
      true
    elsif random_number < 9
      false
    end
  end

  def rand_num
    rand(1...10)
  end
end
