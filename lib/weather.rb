class Weather
  def randomize
    sn, st = :sunny, :stormy
    [sn, sn, sn, sn, sn, st].sample
  end
end
