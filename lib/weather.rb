class Weather

  def stormy?
    @stormy = random
  end

  def random
    rand(4).to_i == 1
  end
end
