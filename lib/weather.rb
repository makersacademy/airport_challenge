class Weather

  def stormy?
    range = 1..100
    true if range.to_a.sample == 1
  end
end
 