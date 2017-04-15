class Weather
  def stormy?
    forecast == :storm
  end

  private

  CONDITIONS = [:storm, :clear, :clear, :clear, :clear]

  def forecast
    CONDITIONS.sample
  end
end
