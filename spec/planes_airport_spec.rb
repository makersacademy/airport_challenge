require './lib/Planes.rb'

describe Airport do
 
  it 'expects Airport to respond to land' do
      expect(subject).to respond_to(:land)
  end
  
  it 'expects a plane to land in the airport' do
      plane = Plane.new
      expect(subject.land(plane)).to include(plane)
  end

  it 'expects Airport to respond to take_off' do
      expect(subject).to respond_to(:take_off)
  end

  it 'expect take_off to remove plane from airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq(plane)
  end
  
  it 'expects plane not to land if ariport full' do
    plane = Plane.new
    (subject.capacity).times{(subject.land(plane))}
    expect { subject.land(plane) }.to raise_error 'Airport is full'
  end

end