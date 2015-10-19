module Weather
  def weather?
    rand(6) + 1 < 6 ? :sunny : :stormy
  end
end
