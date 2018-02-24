class Weather
  def report
    rand < 0.75 ? 'clear' : 'stormy'
  end
end
