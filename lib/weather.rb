class Weather

  def self.stormy?
    Kernel.rand(10) < 3
  end

end
