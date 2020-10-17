class Plane   # the class - is an object = noun in the user story
  def land   # insatnce method = verb in the user story
    @location = "airport"    # intance variable (its like a bucket - take/put information)
  end

  def location
    @location
  end
end


# plane_1 = Plane.new 
# plane_2 = Plane.new 

# plane_1.land   # 
# plane_1.location