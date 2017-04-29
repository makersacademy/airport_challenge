class Weather

  def initialize
    @stormy = rand(2) == 0 ? false : true
  end

  def stormy?
    @stormy
  end

  def sunny?
    !@stormy
  end

  def set_stormy
    @stormy = true
  end

  def set_sunny
    @stormy = false
    true
  end

end
