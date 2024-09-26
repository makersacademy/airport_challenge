require 'airport'
describe Airport do 
  let(:plane) { double :plane }
  it 'should land a plane' do 
    plane = plane
    subject = Airport.new
    expect(subject.land_plane(plane)).to be_truthy
  end

  it 'confrim plane has taken off' do
     airport = Airport.new
    expect { airport.take_off }.to raise_error 'Plane taken off'
  end 

  it 'should report airport is full' do 
    Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
    expect { subject.land_plane(plane) }.to raise_error 'airport full'
  end 

  it 'allows overriden of default capacity' do
    subject = Airport.new(10)
    expect(subject.capacity).to eq (10)  
  end
   it 'should check for weather condition'
   subject.land_plane(plane)
end 