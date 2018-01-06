class Weather

  def storm?
    false if rand(4) > 0
    true
  end
end
