class Weather

  attr_reader :stormy

  def stormy_weather
    @stormy = true
  end

  def stormy?
    rand(10) == 7 #need to fix this in rspec because the rspec test only passes when no. is 7 atm
  end

end
