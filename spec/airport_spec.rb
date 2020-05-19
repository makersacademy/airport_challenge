require 'airport'
require 'plane'

describe Airport do
  DEFAULT_CAPACITY = 10
  let(:airport) { Airport.new(DEFAULT_CAPACITY) } 
  let(:plane) { double :plane }
  
  it "creates attributes capacity and hangar" do
    expect(subject).to have_attributes(capacity: DEFAULT_CAPACITY, hangar: [])
  end

  it "has a default capacity that can be overridden as appropriate." do 
    airport = Airport.new(25)
    expect(airport.capacity).to eq(25)
  end
  
  context "when not stormy" do
    before {allow(airport).to receive(:stormy?).and_return(false)}
    
    it "can land and take off plane" do
      expect { airport.land(plane) }.not_to raise_error
      expect { airport.take_off(plane) }.not_to raise_error
    end
    
    it "raises error when hangar array is greater than or equal to default capacity" do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Plane cannot land: airport full"
    end
  end
  
  context "when stormy" do
    before do
      allow(airport).to receive(:stormy?) { true }
    end
    
    it "raises error and does not allow plane to land." do
      expect { airport.land(plane) }.to raise_error "Plane cannot land: weather is stormy"
    end
    
    it "checks that it can occasionally be stormy" do 
      allow(Kernel).to receive(:rand).and_return 1
      # allow(airport).to receive(:stormy?)
      expect(subject.stormy?).to be true 
    end
    
    context "it does not allow plane to take_off." do
      it "raises error" do
        expect { airport.take_off(plane) }.to raise_error "Plane cannot take_off: weather is stormy"
      end
    end
  end
end
