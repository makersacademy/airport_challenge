require './lib/Planes.rb'

describe Airport do
 
  it 'expects Airport to respond to land' do
    expect(subject).to respond_to(:land)
  end
  
  it 'expects a plane to land in the airport' do
    plane = Plane.new
    allow(subject).to receive(:weather_today) { 1 }
    expect(subject.land(plane)).to include(plane)
  end

  it 'expects Airport to respond to take_off' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'expect take_off to remove plane from airport' do
    allow(subject).to receive(:weather_today) { 1 }
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff).to eq(plane)
  end
  
  it 'expects plane not to land if airport full' do
    allow(subject).to receive(:weather_today) { 1 }
    plane = Plane.new
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error 'Airport is full'
  end
  
  describe '#takeoff' do
    it 'expect takeoff to fail if no planes are at the airport' do
      expect { subject.takeoff }.to raise_error 'There are no planes ready for takeoff'
    end
  end
    
  it 'expects plane not too land in risky weather' do
    plane = Plane.new
    allow(subject).to receive(:weather_today) { 2 }
    expect { subject.land(plane) }.to raise_error 'It is too risky to land'
  end
  
  it 'expects plane not to takeoff in risky weather' do
    allow(subject).to receive(:weather_today) { 2 }
    expect { subject.takeoff }.to raise_error 'It is too risky to takeoff'
  end
  
end
