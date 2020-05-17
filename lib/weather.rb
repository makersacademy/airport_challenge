class Weather

  def status
    return "stormy" if random_number > 7

    "clear"
  end

  private

  def random_number
    rand(1..10)
  end

end
