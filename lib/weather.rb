class Weather 
  def stormy? 
    random_outlook == :stormy
  end

  private

  OUTLOOKS = [:stormy, :normal, :normal, :normal]

  def random_outlook
    OUTLOOKS.sample
  end 
end 