class Plane
  CHANCE_OF_STORM = 0.25

  def weather
    rand() <= CHANCE_OF_STORM ? 'stormy' : 'sunny'
  end

end
