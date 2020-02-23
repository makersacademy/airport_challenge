require 'airport.rb'

describe Airport do
  
  let(:plane) { Plane.new }

  before do 
    allow_any_instance_of(Weather).to receive(:stormy?) { false }
  end

  describe "#land" do
    it "should land plane at airport" do
      expect(subject.land(plane)).to eq [plane]
    end

    it "raises error when airport full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "Airport full"
    end

    it "raises error when weather is stormy" do
      allow_any_instance_of(Weather).to receive(:stormy?) { true }
      expect { subject.land(plane) }.to raise_error "Bad weather, cannot land"
    end
  end

  describe "#take_off" do
    it "returns error if no planes in airport" do
      expect { subject.take_off }.to raise_error "No planes in airport"
    end

    it "returns plane" do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has variable capacity' do
      airport = Airport.new(20)
      20.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end
  end

end
