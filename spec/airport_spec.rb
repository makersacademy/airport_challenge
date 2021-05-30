require 'airport'

describe Airport do
  it 'allows planes to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'allows planes to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'confirms plane is not in the airport after take off' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes_in_airport).to eq nil
  end
  
  it 'prevents plane from landing if airport is full' do
    100.times { subject.land(Plane.new) }
    expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  end




end