class Weather

  def stormy?
    return false if chance < 0.9
    true
  end

  def chance
    rand
  end

end
