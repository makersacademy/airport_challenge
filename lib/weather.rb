class Weather 

  def report(weather)
    case weather
    when 1
      'stormy'
    when 2 
      'clear'
    end
  end

  def stormy?
    conditions = rand(1..3)
    report(conditions) == 'stormy' 
  end
end

