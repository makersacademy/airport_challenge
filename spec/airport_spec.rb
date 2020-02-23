require 'airport.rb'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  describe "#land" do
    it "should land plane at airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it "raises error when airport full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end
  end

  it { is_expected.to respond_to(:take_off) }

  describe "#take_off" do
    it "returns error if no planes in airport" do
      expect { subject.take_off }.to raise_error "No planes in airport"
    end

    it "returns plane" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport full'
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
