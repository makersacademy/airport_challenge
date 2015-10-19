class Weather

  def stormy?
    condition == :stormy
  end

  private

  def condition
    arr = [:stormy,:clear,:clear,:clear,:clear]
    r = rand(arr.length)
    arr.sample
  end
end