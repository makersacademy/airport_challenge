class Weather

  def initialize
    @probability = { "Stormy" => 2, "Sunny" => 8 }
    @current = generate
  end

  def generate
    return "Stormy" if (rand(1..10) - @probability["Stormy"]) <= 0
    "Sunny"
  end
end
