class Weather
  def self.stormy?
    rand(1..7) == 1 ? true : false
  end
end
