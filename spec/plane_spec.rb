require 'plane'
require 'airport'

describe Plane do
    describe'# land' do 
      it'instructs the plane to land' do 
        plane = Plane.new 
        airport = Airport.new 
        plane.land(airport)
        expect(airport.hangar).to include(plane)
       end 
       it'will raise an error if the airport is full' do 
           plane = Plane.new 
           plane2 = Plane.new 
           airport = Airport.new 
           plane.land(airport)
           expect{plane2.land(airport)}.to raise_error 'airport is full'
       end 
           
           
   end 
  describe '#take off' do 
     it'instructs a plane to take off' do 
         airport = Airport.new 
         subject.land(airport)
         subject.takeoff 
         expect(airport.hangar).not_to include(subject)
     end 
     it' returns the plane tookoff' do 
         airport = Airport.new 
         subject.land(airport)
         expect(subject.takeoff).to eq('plane tookoff')
     end 
 end 
 

end