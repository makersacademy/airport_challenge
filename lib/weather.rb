class Weather

  def stormy?
    random_number > 8
  end

private

  def random_number
    rand(10)
  end

end
