class Weather
  def stormy
    condition = rand(6)
    case condition
    when 0, 1, 2, 3, 4, 5
      false
    when 6
      true
    end
  end
end
