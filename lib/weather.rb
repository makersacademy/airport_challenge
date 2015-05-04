module Weather
  def stormy?
    num = rand(1..20)
    num == 3 ? true : false
  end

  def sunny?
    stormy? ? false : true
  end
end