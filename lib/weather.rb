module Weather

  def weather
    weather=rand(4)
    weather==1 ? :stormy : :sunny
  end

end