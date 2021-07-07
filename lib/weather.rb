class Weather

  def forecast
    return :stormy if random_number > 7

    :sunny
  end

  private

  def random_number
    rand(1..10)
  end

end
