class Weather

  STORM_DANGER = 0.9

  def stormy?
    rand > STORM_DANGER
  end

end
