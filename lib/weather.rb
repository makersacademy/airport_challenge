class Weather

  def current_conditions
    randon_number == 10 ? general_conditions[0] : general_conditions[1]
  end

  private

  def random_number
    rand(1..10)
  end

  def general_conditions
    ["stormy", "fine"]
  end

end
