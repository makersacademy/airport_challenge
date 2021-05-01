class Weather
  def self.get_current
    num = rand(11)
    num == 10 ? "Stormy" : "Sunny"
  end
end