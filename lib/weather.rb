class Weather

  def status
    return "stormy" unless rand(0..1).zero?

    return "fine"
  end
end
