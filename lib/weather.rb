
class Weather
  attr_reader :random_number, :stormy

  def initialize
    @random_number = rand(3)
    @random_number <= 1 ? @stormy = false : @stormy = true
  end

end
