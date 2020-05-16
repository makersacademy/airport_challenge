class Weather

  def forecast
    if random_number < 8
      'sunny'
    else
      'stormy'
    end
  end

private

  def random_number
    rand(1..10)
  end

end
