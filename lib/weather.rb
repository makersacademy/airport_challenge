class Weather

  attr_reader :sunny

  def initialize
  rand(10) > 0 ? @sunny = true : @sunny =  false
  end

  def sunny?
    sunny
  end

end