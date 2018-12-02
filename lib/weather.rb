class Weather

  def random
    rand(1..7)
  end

  def conditions
    case random
    when 1
      true
    else
      false
    end
  end

end
