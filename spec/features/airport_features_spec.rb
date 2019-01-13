require 'airport'

describe Airport do

  describe '#land' do
    let(:plane) { double('plane') }

    it 'can be instructed to accept a plane landing' do
      expect(subject.land(plane)).to eq [plane]
    end

    it 'contains any landed planes' do
      subject.land(plane)
      expect(subject.planes.count).to eq 1
    end

    context 'if the plane has already been landed' do
      let(:airport) { Airport.new }

      before do
        airport.instance_variable_set(:@planes, [plane])
      end

      it 'throws error if plane is already landed' do
        expect { airport.land(plane) }.to raise_error "Warning: this plane is already in the airport."
      end

      it 'does not add plane if it is already landed' do
        expect { airport.land(plane) }.to raise_error "Warning: this plane is already in the airport."
        # I have to expect the error message in order not to fail out of the test Example and proceed to the next line.
        expect(airport.planes.count).to eq 1
      end
    end
  end

  describe '#takeoff' do
    let(:plane) { double('plane') }
    let(:airport) { Airport.new }

    before do
      airport.instance_variable_set(:@planes, [plane])
    end

    it 'can instruct a plane to take off' do
      airport.take_off(plane)
      expect(airport.planes.count).to eq 0
    end

    let(:cheeseburger) { double('cheeseburger') }

    it 'returns the object which takes off' do
      airport.instance_variable_set(:@planes, [cheeseburger])
      expect(airport.take_off(cheeseburger)).to eq cheeseburger
      p airport
    end

    it 'raises an error if the plane is not there' do
      airport.instance_variable_set(:@planes, [])
      expect { airport.take_off(plane) }.to raise_error 'That plane is not here'
    end

  end

end
