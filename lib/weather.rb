
class Weather

  def stormy?
    random == 3
  end

  private

  def random
    1 + rand(9)
  end

end
