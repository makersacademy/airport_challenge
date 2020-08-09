class Weather
  attr_reader :generator

  def initialize
    @generator = rand(1..10)
  end
end
