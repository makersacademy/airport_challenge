class Weather

  def randomize
    @stormy = rand(0..9) == 9
  end

  def stormy
    @stormy
  end

end