module Weather
  SUNNINESS = 10

  def stormy?
    rand(SUNNINESS) == 0
  end
end
