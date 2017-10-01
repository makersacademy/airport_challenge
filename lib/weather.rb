class Weather

  attr_reader :stormy

  def stormy?
    rand(10) == 7
  end

end
