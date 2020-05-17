class Weather

  def forecast
    number < 5 ? 'sunny' : 'stormy'
  end
end
private

def number
  rand(1..5)
end
