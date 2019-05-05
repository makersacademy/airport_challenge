class Weather
  def condition
    if rand(100) < 90
      'good'
    else
      'bad'
    end
  end
end
