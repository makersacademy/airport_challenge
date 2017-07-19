require 'airport'


describe Airport do


  it 'responds to land plane' do
    expect(subject).to respond_to :land_plane

  end

  it 'controller allows plane to land' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end

  it 'there is a plane that has landed at airport' do
    expect(subject).to respond_to :landed

  end

  it 'responds to takeoff plane' do
    expect(subject).to respond_to :takeoff
  end

  it 'airport shows there is a plane at the airport' do
    plane = Plane.new
    subject.landed(plane)
    expect (subject.landed(plane))
  end

  it 'controller allows plane to leave the airport' do
    plane = Plane.new
    expect { subject.takeoff(plane) }.to raise_error "no more planes."

  end

  it 'responds to a capacity' do
    plan = Plane.new
    expect expect { (subject.capacity + 1).times {subject.landed(Plane.new)} }.to raise_error "no more planes."
  end

  it 'should enable airport with a custom capacity' do
    airport = Airport.new(100)
    capacity = airport.capacity
    expect(capacity).to eq 100
    expect { (capacity + 1).times {airport.landed(Plane.new)} }.to raise_error "no more planes."
  end


end
