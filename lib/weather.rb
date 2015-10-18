module Weather
  @bad_weather = true
  @cloud_seeding = false
  def stormy? #(simulation=false)
    (@cloud_seeding || (@bad_weather && rand(3)+1 == 1)) #returns true or false
  end
rand(3)+1 == 1
  def cloud_seeding #rig bad weather
    @cloud_seeding = true
  end

  def sunny_weather #rig good weather
    @bad_weather = false
  end

end