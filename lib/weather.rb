class Weather
  attr_reader :stormy, :random_number

  def initialize random_number=Random.rand(1..10)
    @random_number = random_number
    @random_number <= 2 ? @stormy=true : @stormy=false
  end

end
