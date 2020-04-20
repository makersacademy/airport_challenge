require './lib/airport.rb'

describe Airport do


  describe "#land arguments" do
    it "plane should be able to #land" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe "#takeoff arguments" do
    it "plane should be able to #land" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
  # it { is_expected.to respond_to :take_off }


  describe '#initialize' do
    let(:plane) {Plane.new}
    it 'with default capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
    expect { subject.land(plane) }.to raise_error 'WARNING! AIRPORT FULL!'
    end
  end

  describe '#take_off' do
    let(:plane) {Plane.new}
    it "prevents takeoff during stormy weather" do
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.take_off(plane) }.to raise_error 'STORMY WEATHER! TAKEOFF NOT ALLOWED!'
    end

    it "plane confirms that left the airport" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.take_off(plane)).to eq "Plane confirms that no longer at airport"
    end

  end


end
