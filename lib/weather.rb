class Weather

  def stormy?
    get_random_num % 15 == 0
  end

  private

  def get_random_num
    num = rand(1..100)
  end
end
