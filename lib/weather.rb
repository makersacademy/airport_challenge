class Weather
  def stormy
    rand(2).even? ?  @stormy = true : @stormy = false
  end
end
