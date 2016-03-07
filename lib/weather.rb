class Weather
  attr_reader :random_number

  def initialize number=Random.rand(1..10)
    @number = number
  end

  def stormy? number=Random.rand(1..10)
    @number <= 2 ? true : false
  end
end
