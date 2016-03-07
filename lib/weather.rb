module Weather
  def stormy?
    predict < 20
  end

  private

  def predict
    rand(100)
  end
end
