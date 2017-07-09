require 'airport'

describe Airport do

  describe '#initialize' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  it { is_expected.to respond_to(:plane) }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands something' do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end

    it 'confirms that a plane has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq plane
    end

    # it 'prevents a plane from landing if the weather is stormy' do
    #  plane = Plane.new
    #  subject.land(plane)
    #  expect { subject.land(plane) }.to raise_error "Storms prevent landing"
    # end
    it 'prevents landing when full' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land(Plane.new)
      end
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end

    it 'tells a plane that it is no longer flying' do
      plane = Plane.new
      subject.land(plane)
      expect(plane.flying?).to eq false
    end

    it 'tells a plane that it has landed' do
      plane = Plane.new
      subject.land(plane)
      expect(plane.landed?).to eq true
    end

  end

  describe '#take_off' do
    let(:weather) { double(:weather, stormy?: false) }
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'confirms that a plane has taken off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "#{plane} has taken off"
    end

    it 'confirms that a plane is no longer in the airport after take off' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.plane).to eq nil
    end

    it 'prevents a plane from taking off when the weather is stormy' do
      plane = Plane.new
      subject.land(plane)
      allow(weather).to receive(:stormy?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error "Storms prevent take off"
    end

    it 'tells a plane it is now flying' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(plane.flying?).to eq true
    end

    it 'tells a plane it is no longer landed' do
      plane = Plane.new
      subject.land(plane)
      subject.take_off(plane)
      expect(plane.landed?).to eq false 
    end

  end
end
