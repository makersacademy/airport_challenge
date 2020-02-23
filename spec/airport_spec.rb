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
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(plane) }.to raise_error "Airport full"
    end

    context "weather condition" do
      it "allows plane to land in clear weather" do
        expect { subject.land(plane) }.not_to raise_error
      end

      it "raises error when weather is stormy" do
        allow_any_instance_of(Weather).to receive(:stormy?) { true }
        expect { subject.land(plane) }.to raise_error "Bad weather, cannot land"
      end
    end
    
  end

  describe "#take_off" do

    before do
      subject.land(plane)
    end

    it "returns error if plane left airport" do
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error "Plane not in airport"
    end

    it "returns error is not in this airport" do
      expect { subject.take_off(Plane.new) }.to raise_error "Plane not in airport"
    end

    it "returns plane" do
      expect(subject.take_off(plane)).to eq plane
    end

    context "weather condition" do
      it "allows plane to take off in clear weather" do
        expect { subject.take_off(plane) }.not_to raise_error
      end

      it "raises error when weather is stormy" do
        allow_any_instance_of(Weather).to receive(:stormy?) { true }
        expect { subject.take_off(plane) }.to raise_error "Bad weather, cannot take off"
      end
    end

  end

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has variable capacity' do
      airport = Airport.new(20)
      20.times do
        airport.land(Plane.new)
      end
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end
  end

end
