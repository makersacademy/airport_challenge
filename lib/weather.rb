class Weather

  def stormy?
    random = rand(1..11)
    if random == 1
      true
      elsif random == 2
        return true
      else
        return false
    end
  end
end
