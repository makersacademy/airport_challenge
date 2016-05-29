require 'airport'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  context 'when setting capacity' do

    it 'sets capacity to the correct amount' do
      airport.set_capacity(10)
      expect(subject.capacity).to eq(10)
    end

    it 'accepts only positive numbers' do
      expect(subject.set_capacity(-5)).to eq("Capacity cannot be negative")
    end

  end

  context 'when accepting a plane for landing' do

    it 'returns permission to the plane' do
      allow(weather).to receive(:get_weather) {'Fine'}
      expect(subject.accept_landing(plane, weather)).to eq true
    end
      
    it 'adds the plane to the record of planes stored at that airport' do
      allow(weather).to receive(:get_weather) {'Fine'}
      subject.accept_landing(plane, weather)
      expect(subject.planes).to eq([plane])
    end

    it 'denies permission when airport is already at capacity, returning an explanation for the denial to the plane' do
      subject.set_capacity(0)
      expect(subject.accept_landing(plane)).to eq("Airport already at capacity")
    end

    it 'denies permission when weather is stormy, returning an explanation for the denial to the plane' do
      allow(weather).to receive(:get_weather) {'Stormy'}
      expect(subject.accept_landing(plane, weather)).to eq("Weather too stormy")
    end

  end

  context 'when allowing a plane to take-off' do 

    it 'returns permission to the plane' do
      allow(weather).to receive(:get_weather) {'Fine'}
      subject.accept_landing(plane, weather)
      expect(subject.allow_take_off(plane, weather)).to eq(true)
    end


    it 'denies permission when weather is stormy, returning an explanation for the denial' do
      allow(weather).to receive(:get_weather) {'Fine'}
      subject.accept_landing(plane, weather)
      allow(weather).to receive(:get_weather) {'Stormy'}
      expect(subject.allow_take_off(plane, weather)).to eq("Weather too stormy")
    end

  end

end

