module Weather

  def weather?
    rand(8) <= 1 ? "stormy" : "sunny"
  end

end
