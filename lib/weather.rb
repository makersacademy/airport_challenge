class Weather

  def stormy?
    condition = rand(1..10)
    return true if condition > 7
      else
        false
  end
end
