class Weather

  def forecast
    random_number > 7
  end

  private

  def random_number
    rand(1..10)
  end

end
