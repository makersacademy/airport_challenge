class Weather
  def self.stormy?
    rand(1..10) == 1 ? true : false
  end
end
