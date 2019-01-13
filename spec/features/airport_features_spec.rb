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

end
