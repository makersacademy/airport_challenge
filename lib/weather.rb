class Weather

  attr_reader :sunny

  def initialize
    rand(5) < 4 ? @sunny = true : @sunny = false
  end

end
