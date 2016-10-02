

class Weather

  def stormy?
    assign_outlook == :stormy
  end

  private

  OUTLOOKS = [:fine, :fine, :fine, :stormy]

  def assign_outlook
    OUTLOOKS.sample
  end

end
