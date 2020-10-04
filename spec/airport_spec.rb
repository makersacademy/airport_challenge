require 'airport'

describe Airport do
  let(:plane) { double :plane, :in_airport? => false, :landed => true }
  let(:airport) { Airport.new }
  let(:small_airport) { Airport.new(5) }

  describe '#initialize' do
    it 'has a default capacity of 20' do
      expect(subject.capacity).to eq(20)
    end

    it 'has a variable capacity' do
      expect(small_airport.capacity).to eq(5)
    end
  end

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should raise error if Airport is full' do
      allow(subject).to receive(:weather_report).and_return("sunny")
      allow(subject).to receive(:already_landed).and_return(false)
      20.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "This airport is full."
    end

    it 'should raise error if weather at aiport is stormy' do
      allow(subject).to receive(:weather_report).and_return("stormy")
      expect { subject.land(plane) }.to raise_error "Stormy weather, landing not possible."
    end

    it 'should not allow landing if plane already in specific airport' do
      allow(subject).to receive(:weather_report).and_return("sunny")
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Plane already in airport."
    end

    it 'should not allow landing if plane already in another airport' do
      allow(airport).to receive(:weather_report).and_return("sunny")
      allow(subject).to receive(:weather_report).and_return("sunny")
      airport.land(plane)
      allow(plane).to receive(:in_airport?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Plane in another airport."
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'releases planes' do
      allow(plane).to receive(:flying)
      allow(subject).to receive(:weather_report).and_return("sunny")
      subject.land(plane)
      plane_1 = subject.take_off(plane)
      expect(plane).to eq(plane_1)
    end

    it 'should raise error if weather at aiport is stormy' do
      allow(airport).to receive(:weather_report).and_return("sunny")
      airport.land(plane)
      allow(airport).to receive(:weather_report).and_return("stormy")
      expect { airport.take_off(plane) }.to raise_error "Stormy weather, take-off not possible."
    end

    it 'should only allow take_off if plane is in airport' do
      allow(airport).to receive(:weather_report).and_return("sunny")
      expect { airport.take_off(plane) }.to raise_error "Plane not in airport."
    end
  end

end
