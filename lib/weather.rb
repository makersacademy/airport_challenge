class Weather
  attr_reader :state

  def initialize
    # 1 is sunny, 2 is stormy
    @state = rand(1..2)
  end
end
