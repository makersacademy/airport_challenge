require './lib/airport.rb'

describe Airport do


  describe "#land" do
    it "plane should be able to #land" do
      expect(subject).to respond_to :land
    end
  end

  it { is_expected.to respond_to :take_off }


  describe '#initialize' do
    it 'with default capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land
      end
    expect { subject.land }.to raise_error 'WARNING! AIRPORT FULL!'
    end
  end

  describe '#take_off' do
    it "prevents takeoff during stormy weather" do
      allow(subject).to receive(:rand).and_return(0)
      expect { subject.take_off }.to raise_error 'STORMY WEATHER! TAKEOFF NOT ALLOWED!'
    end

    # THE FOLLOWING TEST FAILS
    it "plane confirms that left the airport" do
      expect(subject.take_off).to eq "Plane confirms that no longer at airport"
    end

  end


end
