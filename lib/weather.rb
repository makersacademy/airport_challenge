module Weather

  def stormy?(simulation=false)
    simulation || @cloud_seeding ? true : rand(3)+1 == 1
  end

  def cloud_seeding
    @cloud_seeding = true
  end

end