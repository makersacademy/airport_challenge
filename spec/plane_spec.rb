require 'plane'
describe Plane do
  let(:airport) { Airport.new }

  describe "#land" do
    it 'lands the plane' do
      allow(airport.weather).to receive(:present_weather).and_return(:clear)
      expect(subject.land(airport)).to be_truthy
    end
    it 'raise error when airport is full' do
      allow(airport.weather).to receive(:present_weather).and_return(:clear)
      airport.change_capacity(0)
      expect { subject.land(airport) }.to raise_error('airport full')
    end
    it 'raise error when already on ground' do
      allow(airport.weather).to receive(:present_weather).and_return(:clear)
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error('already on ground')
    end
    it 'raise error when weather is stormy' do
      allow(airport.weather).to receive(:present_weather).and_return(:stormy)
      expect { subject.land(airport) }.to raise_error('weather is stormy')
    end
  end
  describe "#take_off" do
    it 'tells the plane to take off' do
      allow(airport.weather).to receive(:present_weather).and_return(:clear)
      subject.land(airport)
      expect(subject.take_off).to be_in_air
    end
    it 'raise error if it is already in air' do
      allow(airport.weather).to receive(:present_weather).and_return(:clear)
      subject.land(airport)
      subject.take_off
      expect { subject.take_off }.to raise_error('plane in air')
    end
    it 'raise error when weather is stormy' do
      allow(airport.weather).to receive(:present_weather).and_return(:clear)
      subject.land(airport)
      allow(airport.weather).to receive(:present_weather).and_return(:stormy)
      expect { subject.take_off }.to raise_error('weather is stormy')
    end
  end
end
