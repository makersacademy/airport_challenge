class Weather

  def stormy?
    random_outlook == :stormy
  end

  private

  def random_outlook
    rand_num = Random.new.rand(5)
    rand_num == 1 ? :stormy : :fine
  end
end