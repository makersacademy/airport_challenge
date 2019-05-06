require 'airport'

describe Airport do

  describe 'initialization' do

    subject { Airport.new }
    let(:plane) { Plane.new }

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        allow(subject).to receive(:weather).and_return "sunny"
        subject.land(Plane.new)
      end
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end

    it 'returns an airport with the specified capacity' do
      specified_capacity = described_class::DEFAULT_CAPACITY + 5
      expect(Airport.new(specified_capacity).capacity).to eq(specified_capacity)
    end

  end

  describe "account for random weather value" do

    before(:each) { @airport = Airport.new }

    it "returns stormy weather" do
      allow(@airport).to receive(:weather).and_return "stormy"
      expect(@airport.weather).to eq("stormy")
    end

    it "returns sunny weather" do
      allow(@airport).to receive(:weather).and_return "sunny"
      expect(@airport.weather).to eq("sunny")
    end
  end

  describe '#land' do

    before(:each) { @airport = Airport.new }
    before(:each) { allow(@airport).to receive(:weather).and_return "sunny" }
    before(:each) { @plane = Plane.new }

    it 'lands a plane' do
      expect(@airport.land(@plane)).to include(@plane)
    end

    it 'means a plane is no longer airborne' do
      @airport.land(@plane)
      expect(@plane.airborne).to eq(false)
    end

    it 'raises error when we try to land the same plane twice' do
      @airport.land(@plane)
      message = "Plane already at the airport!"
      expect { @airport.land(@plane) }.to raise_error(message)
    end

    it 'raises error when we try to land a plane already at another airport' do
      other_airport = Airport.new
      allow(other_airport).to receive(:weather).and_return "sunny"
      @airport.land(@plane)
      message = "Plane already at another airport"
      expect { other_airport.land(@plane) }.to raise_error(message)
    end

    it 'raises error if it is stormy' do
      stormy_airport = Airport.new
      allow(stormy_airport).to receive(:weather).and_return "stormy"
      message = "Too stormy to land right now"
      expect { stormy_airport.land(@plane) }.to raise_error(message)
    end

  end

  describe '#take_off' do

    before(:each) { @airport = Airport.new }
    before(:each) { allow(@airport).to receive(:weather).and_return "sunny" }
    before(:each) { @plane = Plane.new }
    before(:each) { @airport.land(@plane) }

    it 'takes off a plane' do
      n = @airport.planes.length
      expect(@airport.take_off(@plane).length).to eq(n - 1)
    end

    it 'takes off a specified plane' do
      expect(@airport.take_off(@plane)).not_to include(@plane)
    end

    it 'means a plane is now airborne' do
      @airport.take_off(@plane)
      expect(@plane.airborne).to eq(true)
    end

    it 'raises error if it is stormy' do
      allow(@airport).to receive(:weather).and_return "stormy"
      message = "Too stormy to take off right now"
      expect { @airport.take_off(@plane) }.to raise_error(message)
    end

    it 'raises an error if plane at a different airport' do
      airport2 = Airport.new
      allow(airport2).to receive(:weather).and_return "sunny"
      message = "Specified plane at another airport"
      expect { airport2.take_off(@plane) }.to raise_error(message)
    end

    it 'raises error when we try to take off the same plane twice' do
      @airport.take_off(@plane)
      message = "Plane already airborne"
      expect { @airport.take_off(@plane) }.to raise_error(message)
    end
  end
end
