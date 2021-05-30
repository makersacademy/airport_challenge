class Plane
  CHANCE_OF_STORM = 0.25

  def weather
    luck <= CHANCE_OF_STORM ? 'stormy' : 'sunny'
  end

  private

  def luck
    rand()
  end
end
