class Weather

attr_reader :stormy

  def stormy
    rand(20) < 4
  end

end
