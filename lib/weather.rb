class Weather
  def conditions
    CONDITIONS[rand(CONDITIONS.length)]
  end

private
  CONDITIONS = [:stormy, :good, :good, :good]
end
