class Weather

  def stormy?
    if random_day == 0
      true
    else
      false
    end
  end

  private

  def random_day
    rand(0..6)
  end

end
