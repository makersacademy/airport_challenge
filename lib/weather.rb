module Weather

  def weather?
    random = rand(20)
    return "Clear" unless random == 1
    return "Stormy"
  end

end
