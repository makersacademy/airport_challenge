module Weather
  def self.stormy?
    rand(1..10) <= 2
  end
end
