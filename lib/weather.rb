class Weather
  STORM_POSSIBILITY = 1

  def stormy?
    STORM_POSSIBILITY < rand(1..50)
  end
end
