class AirportCondition

	 $hangar = ["plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane", "plane"]
     $weather = ["stormy", "sunny"].sample

end

class AirTrafficControl

  def land_plane

    if $weather == "stormy"
      p "The weather is stormy! You can\'t land the plane!"

    elsif $hangar.count == 10
      p "The hangar is full. You can\'t land the plane!"

	  else
		 $hangar << 'plane'
      p "The airplain landed succesfully. There are " + $hangar.count.to_s + " plains in the hangar."

    end
  end

  def takeoff_plane

    if $weather == "stormy"
  	  p "The weather is stormy! You can\'t take off!"

  	elsif $hangar.count == 0
  	  p "All the planes are flying!"

  	else
		 $hangar.shift
  		"The airplane left the hangar and took off succesfully!"
  	end
  end
end
