module Weather
  @@types = [:clear, :clear, :clear, :stormy]

  def random
    @@types.sample
  end
end
