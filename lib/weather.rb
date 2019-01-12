class Weather

  def stormy?
    weather = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy']
  if weather[rand(0..4)] == 'stormy'
    true
  else
    false
  end
end
end
