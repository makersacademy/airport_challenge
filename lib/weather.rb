class Weather
  def status
    n = rand(1..10)
    if (1..7).cover? n 
      :sunny 
    else 
      :stormy
    end
  end
end
