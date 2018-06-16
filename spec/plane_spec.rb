require './lib/plane.rb'

describe Plane do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'should request to land when directed to' do
      airport = double(:airport, :request_landing => true)
      expect(airport).to receive(:request_landing)
      subject.land(airport)
    end

    it 'should be located in an airport after landing in it' do
      airport = double(:airport)
      subject.land(airport)
      expect(subject.current_location).to eq(airport)
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'should request to takeoff when directed to' do
      airport = double(:airport, :request_takeoff => true)
      expect(airport).to receive(:request_takeoff)
      subject.land(airport)
    end

    it 'should be airborne after successful takeoff' do
      airport = double(:airport, :request_takeoff => true)
      plane = plane.new(current_location: airport)
      plane.take_off
      expect(plane.current_location).to eq(:airborne)
    end
  end

  describe '#current_location' do
    it { is_expected.to respond_to(:current_location) }

    it 'should give its current location' do
      plane = Plane.new(current_location: :London)
      expect(plane.current_location).to eq(:London)
    end
  end
end
