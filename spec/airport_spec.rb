require 'airport'

describe Airport do

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

    #it 'prevents a plane from landing if the weather is stormy' do
    #  plane = Plane.new
    #  subject.land(plane)
    #  expect { subject.land(plane) }.to raise_error "Storms prevent landing"
    #end
    it 'prevents landing when full' do
      100.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end

  end

  describe '#take_off' do
    let(:weather) { double(:weather, stormy?: false)}
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
  end
end
