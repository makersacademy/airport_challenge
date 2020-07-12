class Weather

  def stormy?
    rand(1..5) == 1 ? @storm = true : @storm = false
  end

  def storm
    @storm
  end
end
