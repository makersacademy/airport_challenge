module Weather

  def weather
    rand(2) == 1 ? :sunny : :stormy
  end

end
