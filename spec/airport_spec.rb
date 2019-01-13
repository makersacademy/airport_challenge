require 'airport'
require 'plane'

describe Airport do
  describe 'instructions' do
    it { expect(subject).to respond_to(:land) }
    it 'intruct a plane to land at an airport' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:flying).and_return(true)
      expect(subject.land(plane)).to eq plane
    end

    it { expect(subject).to respond_to(:take_off) }
    it 'instruct a plane to take off from an airport' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:flying).and_return(false)
      subject.instance_variable_get(:@planes) << plane
      expect(subject.take_off(plane)).to eq plane
    end

    it 'confirm that it is no longer in the airport' do
      plane = Plane.new
      expect(subject.confirm_take_off(plane)).to eq "#{plane} is no longer in the airport"
    end
  end
  describe 'preventions' do
    it 'prevent landing when weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(true)
      allow(plane).to receive(:flying).and_return(true)
      expect(subject.land(plane)).to eq "weather too stormy to land"
    end

    it 'prevent take off when weather is stormy' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(true)
      subject.instance_variable_get(:@planes) << plane
      expect(subject.take_off(plane)).to eq "weather too stormy to take off"
    end

    it 'prevent landing when the airport is full' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      10.times { airport.land(Plane.new(true)) }
      expect(airport.land(Plane.new(true))).to eq "airport full"
    end

    it 'prevent planes taking off if they are not landed' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:flying).and_return(true)
      subject.instance_variable_get(:@planes) << plane
      expect(subject.take_off(plane)).to eq "plane already flying"
    end

    it 'prevent planes landing if they are not flying' do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:flying).and_return(false)
      expect(subject.land(plane)).to eq "plane already landed"
    end

    it 'prevent planes taking off if they are not in the airport' do
      airport1 = Airport.new
      airport2 = Airport.new
      plane1 = Plane.new
      airport1.instance_variable_get(:@planes) << plane1
      allow(airport2).to receive(:stormy?).and_return(false)
      allow(plane1).to receive(:flying).and_return(false)
      expect(airport2.take_off(plane1)).to eq "plane not in this airport"
    end

    it 'prevent planes landing if they are already in the airport' do
      airport1 = Airport.new
      plane1 = Plane.new
      airport1.instance_variable_get(:@planes) << plane1
      allow(airport1).to receive(:stormy?).and_return(false)
      allow(plane1).to receive(:flying).and_return(false)
      expect(airport1.land(plane1)).to eq "plane already in this airport"
    end
  end

  describe 'override' do
    it 'override the capacity at the creation' do
      airport = Airport.new(15)
      expect(airport.capacity).to eq 15
    end

    it 'override the capacity after the creation' do
      airport = Airport.new
      expect(airport.capacity = 15).to eq 15
    end
  end

  describe 'weather' do
    it { expect(subject).to respond_to(:stormy?) }
    it 'guarantee the weather is unpredictable' do
      airport = Airport.new
      weather_variation1 = []
      weather_variation2 = []
      15.times { weather_variation1 << airport.stormy? }
      15.times { weather_variation2 << airport.stormy? }
      expect(weather_variation1).not_to eq(weather_variation2)
    end
  end
end
