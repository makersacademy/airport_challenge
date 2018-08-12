require './lib/airport'

describe Airport do
  
  it "verifies Airport exists" do
    expect(subject).to be_a(Object)
  end

  it "lands a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it "makes a plane take off" do
    plane = Plane.new
    expect(plane).not_to eql(subject.take_off)
  end

  it "prevents plane from taking off if stormy" do
    subject.report_stormy
    expect { subject.take_off }.to raise_error "Weather is stormy - no taking off, please"
  end

  it "prevents plane from landing if stormy" do
    plane = Plane.new
    subject.report_stormy
    expect { subject.land(plane) }.to raise_error "Weather is stormy - no landing, please"
  end

  it "prevents plane from landing if airport full" do
    plane = Plane.new
    2.times { subject.land plane }
    expect { subject.land(plane) }.to raise_error "Airport is full - no landing, please"
  end

  it 'has a max capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(10)
      10.times { airport.land Plane.new }
      expect(airport.planes.length).to eq airport.capacity
    end
  end

end
