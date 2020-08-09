class Weather
  attr_reader :condition
  def initialize
    @condition = rand(1..10)
  end
end
