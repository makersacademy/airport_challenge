class Weather

  def initialize
    randomiser = rand(2)
    randomiser == 1 ? @weather = "Stormy" : @weather = "Sunny"
  end

  def stormy?
    @weather == "Stormy"
  end

end
