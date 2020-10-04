require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  
  describe '#land' do
    it " allows planes to land" do
      allow(subject).to receive(:stormy?) { false }
      expect { subject.land(plane) }.not_to raise_error
    end

    it 'has the plane after it has landed' do
      allow(plane).to receive(:land)
      subject.land plane
      expect(subject.planes).to include plane
    end

    it " does not allow landing when full" do
      allow(subject).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times { subject.land(Airport.new) }
      expect { subject.land(plane) }.to raise_error "Airport is full" 
    end
  end 

  it 'can take off a plane' do
    allow(subject).to receive(:stormy?).and_return(false)
    subject.land(plane)
    expect(subject.take_off).to be_an_instance_of(Plane)
  end 

  it "plane can not land if weather is stormy" do
    allow(subject).to receive(:random) { 8 }
    expect { subject.land(plane) }.to raise_error "can not land, weather is too stormy"
  end

  it "overrides default capacity" do
    airport = Airport.new(75)
    expect(airport.capacity).to eq 75
  end 

  it "plane can not takeoff if weather is stormy" do
    allow(subject).to receive(:stormy?).and_return(true)
    allow(subject).to receive(:random) { 8 }
    expect { subject.take_off }.to raise_error "can not take off, weather is too stormy"
  end
end 
