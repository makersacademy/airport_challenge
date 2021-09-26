# frozen_literal_string: true

class Weather
  def rare_stormy_weather?
    random_number == 1
  end

  private

  def random_number
    rand(9)
  end
end
