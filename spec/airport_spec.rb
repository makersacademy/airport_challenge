require 'airport'

describe 'Airport' do
  let(:subject) { Airport.new }

  it 'has planes that have landed' do
    plane = Plane.new
    subject.land(plane, 3)
    expect(subject.grounded_planes).to include(plane)
  end
  
  it 'confirms plane is not in Airport' do
    plane = Plane.new
    subject.land(plane, 3)
    
    subject.depart(plane, 3)
    
    expect(subject.grounded_planes).not_to include(plane)
  end

  it 'prevents planes from landing if airport full' do
    4.times{subject.land(Plane.new, 3)}
    puts subject.grounded_planes
    
    expect(subject.max_capacity).to eq("Airport full")
  end

  it 'default airport capacity can be changed' do
    subject.default_airport_capacity = 10
    expect(subject.default_airport_capacity).to eq(subject.overide)
  end

  it 'prevent depature if weather is stormy' do
    plane = Plane.new

    subject.land(plane, 3)
 
    expect(subject.depart(plane, 2)).to eq("Stormy weather, cannot depart")
  end

  it 'prevent landing if weather is stormy' do
    plane = Plane.new

    expect(subject.land(plane, 2)).to eq("Stormy weather, cannot land")
  end

end
