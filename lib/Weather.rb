class Weather

  def stormy?
    condition > 8
  end

  private

  def condition
    condition = rand (0 .. 10)
  end

end
