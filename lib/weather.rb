module Weather
  def sunny?
    rand(1..15)%5 == 0 ? false : true
  end
end
