module Weather
  def weather?
    chance + 1 < 6 ? :sunny : :stormy
  end

  def chance
    rand(6)
  end
end
