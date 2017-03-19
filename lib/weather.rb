class Weather

# change to random sunny or stormy generator later
  def stormy?
    @stormy = random.even? ? true : false
  end

  private

  def random
    num = rand(10)
  end

end
