module Weather

  def self.stormy?
    Determiner < 2
  end

  private

  Determiner = rand(10)

end
