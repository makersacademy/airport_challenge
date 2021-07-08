class Weather

  def generate
    num = rand(5)
    if num == 1
      return "Sunny"
    elsif num == 2
      return "Light drizzle"
    elsif num == 3
      return "Apocalypitcally mild"
    elsif num == 4
      return "Stormy weather!"
    end
  end

end
