require 'airport'

describe Airport do

  it 'plane lands and is stored in the airport dock' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

   it 'plane takes off' do
     plane = Plane.new
     subject.land(plane)
     expect(subject.take_off).to eq plane
   end

   it 'raises an error if the hanger is full' do
     Airport::DEFAULT_CAPACITY.times {subject.land Plane.new}
     expect {subject.land Plane.new}.to raise_error "Hanger is full"
   end

   it 'allows capacity to be set by the user'
     land = Airport.new(50)
     expect(land.capacity).to eq 50
   end
end