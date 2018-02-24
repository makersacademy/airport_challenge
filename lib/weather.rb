class Weather
  # this uses an array with .sample to generate random weather
  def randomize
    sn, st = :sunny, :stormy
    [sn, sn, sn, sn, sn, st].sample
  end
end
