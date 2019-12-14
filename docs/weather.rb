module Weather

  def self.stormy?
    if rand(1..5) == 3
      true
    else
      false
    end
  end
end