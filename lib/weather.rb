class Weather
  def generate
    case ramdom_number
      when 1..80 then 'sunny'
      else 'stormy'
    end
  end

  private

  def ramdom_number
    rand(1..100)
  end
end
