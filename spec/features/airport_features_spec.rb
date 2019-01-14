require 'airport'

describe Airport do
  let(:heathrow) { Airport.new }
  let(:plane) { double('plane') }

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "can be given a different initial capacity" do
    expect(Airport.new(15).capacity).to eq 15
  end

  describe '#capacity' do
    it "can change capacity after initialization" do
      heathrow.capacity = 45
      expect(heathrow.capacity).to eq 45
    end
  end

  describe '#land' do
    before do
      allow(heathrow).to receive(:weather).and_return(false)
      heathrow.instance_variable_set(:@planes, [])
    end

    it 'can be instructed to accept a plane landing' do
      expect(heathrow.land(plane)).to eq [plane]
    end

    it 'The airport contains any landed planes' do
      heathrow.land(plane)
      expect(heathrow.planes.count).to eq 1
    end

    it 'raises error if weather is bad' do
      allow(heathrow).to receive(:weather).and_return(true)
      expect { heathrow.land(plane) }.to raise_error 'Inclement weather'
    end

    it 'raises error if airport is full' do
      allow(heathrow).to receive(:weather).and_return(false)
      heathrow.instance_variable_set(:@capacity, 1)
      heathrow.instance_variable_set(:@planes, [Object.new])
      expect { heathrow.land(Object.new)
      }.to raise_error 'Airport full'
    end

    context 'if the plane has already been landed' do
      before do
        heathrow.instance_variable_set(:@planes, [plane])
        allow(heathrow).to receive(:weather).and_return(false)
      end

      it 'throws error if plane is already landed' do
        expect { heathrow.land(plane) }.to raise_error "Warning: this plane is already in the airport."
      end

      it 'does not add plane if it is already landed' do
        expect { heathrow.land(plane) }.to raise_error "Warning: this plane is already in the airport."
        # I have to expect the error message in order not to fail out of the test Example and proceed to the next line.
        expect(heathrow.planes.count).to eq 1
      end
    end
  end

  describe '#takeoff' do
    before do
      heathrow.instance_variable_set(:@planes, [plane])
      allow(heathrow).to receive(:weather).and_return(false)
    end

    it 'can instruct a plane to take off' do
      heathrow.take_off(plane)
      expect(heathrow.planes.count).to eq 0
    end

    let(:cheeseburger) { double('cheeseburger') }

    it 'returns the object which takes off' do
      heathrow.instance_variable_set(:@planes, [cheeseburger])
      expect(heathrow.take_off(cheeseburger)).to eq cheeseburger
    end

    it 'raises an error if the plane is not there' do
      heathrow.instance_variable_set(:@planes, [])
      expect { heathrow.take_off(plane) }.to raise_error 'That plane is not here'
    end

    it 'raises error if weather is bad' do
      heathrow.instance_variable_set(:@planes, [plane, cheeseburger])
      allow(heathrow).to receive(:weather).and_return(true)
      expect { heathrow.take_off(cheeseburger) }.to raise_error 'Inclement weather'
    end

  end

end
