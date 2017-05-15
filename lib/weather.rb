class Weather

  attr_reader :sunny

  def initialize
  rand(10) > 2 ? @sunny = true : @sunny = false
  end

end