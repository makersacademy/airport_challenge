module Weather
  def self.stormy?
    random = Random.new
    random.rand(100) > 80
  end
end
