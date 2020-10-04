require 'airport'

describe Airport do

  describe '#initialize' do
    it 'has a default capacity of 20' do
      expect(subject.capacity).to eq(20)
    end

    it 'has a variable capacity' do
      small_airport = Airport.new(5)
      expect(small_airport.capacity).to eq(5)
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should raise error if Airport is full' do
      allow(subject).to receive(:weather_report).and_return("sunny")
      20.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "This airport is full."
    end

    it 'should raise error if weather at aiport is stormy' do
      allow(subject).to receive(:weather_report).and_return("stormy")
      expect { subject.land(Plane.new) }.to raise_error "Stormy weather, landing not possible."
    end

  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'releases planes' do
      plane = Plane.new
      allow(subject).to receive(:weather_report).and_return("sunny")
      subject.land(plane)
      plane = subject.take_off
      expect(plane).to eq(plane)
    end

    it 'should raise error if weather at aiport is stormy' do
      airport = Airport.new
      allow(airport).to receive(:weather_report).and_return("sunny")
      airport.land(Plane.new)
      allow(airport).to receive(:weather_report).and_return("stormy")
      expect { airport.take_off }.to raise_error "Stormy weather, take-off not possible."
    end

    it 'should only allow take_off if plane is in airport' do
      airport_2 = Airport.new
      airport_1 = Airport.new
      allow(airport_1).to receive(:weather_report).and_return("sunny")
      allow(airport_2).to receive(:weather_report).and_return("sunny")
      plane = Plane.new
      airport_1.land(plane)
      expect { airport_2.take_off(plane) }.to raise_error "Plane not in airport."
    end
  end

end
