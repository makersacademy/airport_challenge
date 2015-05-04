module Weather

  def weather
    rand(1..10) == 1 ? @weather = 'stormy' : @weather = 'sunny'
  end

end