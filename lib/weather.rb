class Weather

  def initialize
    a = rand(4)
    a > 3 ? @weather = "sunny" : @weather = "stormy"
  end

  def stormy?
    @weather == "stormy" ? "true" : "false"
  end

end
