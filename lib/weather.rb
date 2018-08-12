class Weather

  def report
    case rand(6)
      when 1 then "stormy"
      else "sunny"
    end
  end

end
