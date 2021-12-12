class Weather

  def generate
    return "sunny" unless rand(5) == 4
    "stormy"
  end
end