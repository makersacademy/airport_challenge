class Weather
  attr_reader :random_number

  # creates a sunny (80%) and stormy (20%) weather
  def initialize number=Random.rand(1..10)
    @number = number
  end

  def stormy? number=Random.rand(1..10)
    @number <= 2 ? true : false
  end
end
