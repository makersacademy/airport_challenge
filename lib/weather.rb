module Weather
  @@states = [:clear, :clear, :clear, :stormy]

  def self.random
    @@states.sample
  end
end
