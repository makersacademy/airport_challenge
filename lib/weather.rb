class Weather
  attr_reader :stormy, :random_number

  def initialize random_number=Random.rand(1..100)
    @random_number = random_number
    @random_number <= 20 ? @stormy=true : @stormy=false
  end

end
