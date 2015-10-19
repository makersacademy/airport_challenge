module Weather

  def stormy?
    condition == :stormy
  end

  private

  def condition
    arr = [:stormy,:clear,:cloudy]
    r = rand(arr.length)
    arr.sample
  end
end
