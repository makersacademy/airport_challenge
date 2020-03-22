require 'plane'
require 'airport'

describe Plane do

it 'instructs a plane to land' do
    expect(subject).to respond_to :land_plane
end
    it 'instructs the plain to take off' do
      expect(subject).to respond_to :take_off 
    end
    
    it 'lets you know when the plane is no longer present' do
         plane = Plane.new
           plane.take_off
            expect(plane::present).to eq false
    end

    it 'Prevents a plane from landing if the airport is full' do
        airport = Airport.new 
      expect(subject.can_i_land(airport::airport_full)).to eq true     
   end

   it 'Has a default airport capasity' do
    airport = Airport.new
    expect(airport::capasity).to equal(30)
   end

it 'allows you to change capasity' do
    airport = Airport.new(50)
    expect(airport::capasity).to equal(50)
   end
end