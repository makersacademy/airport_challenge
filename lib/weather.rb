class Weather

  def initialize
    @weather = sunny?
  end

  def sunny?
    rand(999) < 900
  end

end
