class Weather
  attr_reader :storm

  def stormy?
    rand(1..5) == 1 ? @storm = true : @storm = false
  end

end
