module Weather

  Determiner = rand(10)

  def self.stormy?
    Determiner < 2 ? true : false
  end

end
