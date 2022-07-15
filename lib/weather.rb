class Weather 
  def outlook
    rand(1..100) == 1 ? 'stormy' : 'sunny'
  end
end