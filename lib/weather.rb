class Weather

  def stormy?
    random_value == 10 
  end

  private

  def random_value
    rand(10) + 1
  end

end
