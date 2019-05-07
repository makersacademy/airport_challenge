class Weather
  def status?
    selection = rand(3)
    if selection == 3
      'stormy'
    else
      'sunny'
    end
  end
end
