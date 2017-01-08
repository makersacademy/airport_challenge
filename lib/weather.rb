module Weather

  def self.stormy?
    rand(9) <= 1 ? true : false
  end

end
