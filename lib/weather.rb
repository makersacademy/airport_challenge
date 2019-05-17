class Weather
  attr_reader :stormy

  def initialize
    choose_state = rand(10) + 1
    (choose_state % 4).zero? ? @stormy = true : @stormy = false
  end
end
