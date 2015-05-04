module Weather
  def stormy?
    num = rand(1..20)
    if num == 3
      true
    else
      false
    end
  end

  def sunny?
    stormy? ? false : true
  end
end