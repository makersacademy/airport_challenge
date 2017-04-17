module Weather
  def weather?
    rand > 0.9 ? :stormy : :sunny
  end
end
