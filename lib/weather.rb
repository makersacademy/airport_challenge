module Weather
  def self.report
    rand(2) == 1 ? "Storms on the Horizon" : "Blue Skies Ahead"
  end
end
