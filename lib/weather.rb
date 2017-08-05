class Weather

  CONDITIONS = [:storm, :clear, :clear, :clear, :clear, :clear]

  def stormy?
    CONDITIONS.sample == :storm
  end
end
