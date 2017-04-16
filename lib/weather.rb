class Weather

  def condition(condition = { 1 => 'sunny', 2 => 'sunny', 3 => 'sunny', 4 => 'stormy' })
    @condition = condition[rand(1..4)]
  end

end
