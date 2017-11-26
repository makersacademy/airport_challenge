class Weather

  def conditions
    rand(5) > 1 ? @weather = "CLEAR" : @weather = "STORMY"
  end

end
