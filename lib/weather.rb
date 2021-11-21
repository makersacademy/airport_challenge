module Weather 
  def forecast
    n = rand(1..10)
    n.between?(1, 8) ? "sunny" : "stormy"
  end
end
