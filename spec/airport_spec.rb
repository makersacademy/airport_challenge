require 'airport'

describe Airport do

  context 'All tests require an Airport'
  before(:each) { @airport = Airport.new }

  describe "account for random weather value" do

    it "returns stormy weather" do
      allow(@airport).to receive(:weather).and_return :stormy
      expect(@airport.weather).to eq(:stormy)
    end

    it "returns sunny weather" do
      allow(@airport).to receive(:weather).and_return :sunny
      expect(@airport.weather).to eq(:sunny)
    end
  end

  describe 'initialization' do

    it 'defaults capacity' do
      expect(@airport.send(:capacity)).to eq(described_class::DEFAULT_CAPACITY)
    end

    it 'returns an airport with the specified capacity' do
      expect(Airport.new(90).send(:capacity)).to eq(90)
    end
  end

  describe 'these tests mostly require a new Plane instance and sunny weather' do

    before(:each) { @plane = Plane.new }
    before(:each) { allow(@airport).to receive(:weather).and_return :sunny }

    describe '#land' do

      it 'lands a plane' do
        expect(@airport.land(@plane)).to include(@plane)
      end

      it 'means a plane is no longer airborne' do
        @airport.land(@plane)
        expect(@plane.airborne).to eq(false)
      end

      it 'prevents landing when airport is full and raises error' do
        described_class::DEFAULT_CAPACITY.times do
          @airport.land(Plane.new)
        end
        expect { @airport.land(@plane) }.to raise_error 'Abort - Airport full'
      end

      it 'raises error when we try to land the same plane twice' do
        @airport.land(@plane)
        message = "Plane already at the airport!"
        expect { @airport.land(@plane) }.to raise_error(message)
      end

      it 'raises error when trying to land a plane already at another airport' do
        other_airport = Airport.new
        allow(other_airport).to receive(:weather).and_return :sunny
        @airport.land(@plane)
        message = "Plane already at another airport"
        expect { other_airport.land(@plane) }.to raise_error(message)
      end

      it 'raises error if it is stormy' do
        stormy_airport = Airport.new
        allow(stormy_airport).to receive(:weather).and_return :stormy
        message = "Too stormy to land right now"
        expect { stormy_airport.land(@plane) }.to raise_error(message)
      end
    end

    describe '#take_off' do

      before(:each) { @airport.land(@plane) }

      it 'takes off a plane' do
        n = @airport.send(:planes).length
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
        allow(@airport).to receive(:weather).and_return :stormy
        message = "Too stormy to take off right now"
        expect { @airport.take_off(@plane) }.to raise_error(message)
      end

      it 'raises an error if plane at another airport' do
        other_airport = Airport.new
        allow(other_airport).to receive(:weather).and_return :sunny
        message = "Specified plane at another airport"
        expect { other_airport.take_off(@plane) }.to raise_error(message)
      end

      it 'raises error when we try to take off the same plane twice' do
        @airport.take_off(@plane)
        message = "Plane already airborne"
        expect { @airport.take_off(@plane) }.to raise_error(message)
      end

      it 'raises error when we try to take off an airborne plane' do
        airborne_plane = Plane.new
        message = "Plane already airborne"
        expect { @airport.take_off(airborne_plane) }.to raise_error(message)
      end
    end
  end

  describe 'test that takes off and lands several planes' do
    it 'the program can land 99 planes and take off 33' do
      allow(@airport).to receive(:weather).and_return :sunny
      99.times do
        @airport.land(Plane.new)
      end
      @airport.send(:planes).reject!.with_index do |_, i|
        i % 3 == 0
      end
      expect(@airport.send(:planes).length).to eq(66)
    end
  end
end
