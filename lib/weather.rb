class Weather

  attr_reader :stormy

  def stormy?
    rand(5) == 1 ? true : false
  end
end
