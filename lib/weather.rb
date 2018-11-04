require_relative 'plane'

class Weather

  def weather_today
    rand(1..5)
  end

  def is_stormy?
    case weather_today
      when 1 then false
      when 2 then true
      when 3 then false
      when 4 then true
      when 5 then false
    end
  end

end
