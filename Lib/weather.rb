class Weather

  def stormy?
    random_number <= 1
  end

  private
  def random_number
    rand(6)
  end
end
