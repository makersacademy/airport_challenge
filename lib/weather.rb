class Weather

  def stormy?
    level > 6
  end

private

  def level
    rand(10)
  end
end
