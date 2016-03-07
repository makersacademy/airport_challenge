class Weather
  attr_reader :stormy, :random_number

  def stormy? number=Random.rand(1..10)
    number <= 2 ? true : false
  end
end
