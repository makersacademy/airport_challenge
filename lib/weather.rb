class Weather

  SUNNY_PORCENTAGE = 0.7

  def sunny?
    rand < SUNNY_PORCENTAGE
  end

end
