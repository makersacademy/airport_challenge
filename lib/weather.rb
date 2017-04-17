class Weather

attr_reader :sunny

  def initialize
    @sunny = sunny?
  end

  def sunny?
    @sunny = rand*100 > 10
  end

end
