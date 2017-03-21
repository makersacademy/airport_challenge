class Weather

  def stormy?
    @stormy = random.even? ? true : false
  end

  private

  def random
    rand(10)
  end

end
