# Gets a random number from 1 to 6 and decides whether weather is stormy

class Weather

  def stormy?
    rand_stormy == :stormy
  end

  private
  PRED = [ :stormy, :stormy, :fine, :fine, :fine, :fine]

  def rand_stormy
   PRED.sample
  end
end
