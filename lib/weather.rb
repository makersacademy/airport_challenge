class Weather

  def stormy?
    @stormy = random
  end

  def random
    if rand(4).to_i == 1
      true
    else
      false
    end
  end

end
