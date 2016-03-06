class Weather
  attr_reader :stormy, :random_number

  # creates a sunny (80%) and stormy (20%) weather
  def initialize number=Random.rand(1..10)
    @number = number
    @number <= 2 ? @stormy=true : @stormy=false
  end

end
