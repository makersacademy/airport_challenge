class Weather

  def weather?
    rand
  end

  def forecast
    weather? < 0.2 ? 'Stormy' : 'Calm'
  end

end
