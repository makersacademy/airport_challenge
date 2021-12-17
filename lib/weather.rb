class Weather

  def stormy?
    dice_roll == 6
  end

private

  def dice_roll
    rand(1..6)
  end
end
