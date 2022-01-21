class Planes
  def planes_selector
    all_planes = [
      {:name=>"Driftscream", :status=>"in air"}, 
      {:name=>"Thunder", :status=>"grounded"},
      {:name=>"Flightheat", :status=>"in air"},
      {:name=>"Driftcore", :status=>"grounded"},
      {:name=>"Greycry", :status=>"grounded"},
      {:name=>"Dragonspark", :status=>"in air"},
      {:name=>"Shy Duke", :status=>"grounded"},
      {:name=>"False Falcon", :status=>"in air"}
    ]

  return all_planes.sample

  end 


end


  # return plane_selector.values[0], plane_selector.values[1]


  # puts all_planes.dig(1)

# test = Planes.new

# p test.planes_selector.values