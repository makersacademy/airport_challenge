class Weather

  attr_reader :sunny

  def initialize
    rand(10) == 0 ? @sunny = false : @sunny = true
  end

  def sunny?
    sunny
  end
end
