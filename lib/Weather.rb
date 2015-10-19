module Weather

  def stormy?
    condition > 8
  end

  private

  def condition
    condition = rand(11)
  end

end
