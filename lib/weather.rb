class Weather

  def stormy?
    choose = rand(5)
    weather[choose] == 'stormy'
  end

  private

  weather = ['stormy', 'sunny', 'sunny', 'sunny', 'sunny']

end
