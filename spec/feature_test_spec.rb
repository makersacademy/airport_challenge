require 'airport'

describe 'FeatureTest' do
    
  before do
  allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
  end

  it 'lets shit happen' do
   gatwick = Airport.new
   luton = Airport.new

   plane1 = Plane.new
   plane2 = Plane.new
   plane3 = Plane.new
   plane4 = Plane.new
   plane5 = Plane.new
   plane6 = Plane.new
   plane7 = Plane.new


   gatwick.land(plane1)
   gatwick.land(plane2)
   gatwick.land(plane3)
   gatwick.take_off(plane3)
   luton.land(plane3)
   luton.land(plane4)
   luton.land(plane5)
   luton.take_off(plane4)
   luton.take_off(plane5)
   gatwick.land(plane5)
   gatwick.land(plane4)
  end

end