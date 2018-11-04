require './lib/plane'

describe Plane do
  let(:plane) { described_class.new }

  describe '#sucessful_land' do
    it 'return sucessful land message' do
      expect(plane.sucessful_land(plane)).to eq "#{plane} has landed"
    end
  end
  describe '#sucessful_take_off' do
    it 'return sucessful take off message' do
      expect(plane.sucessful_take_off(plane)).to eq "#{plane} has left airport"
    end
  end
  describe '#unsucessful_take_off_bad_weather' do
    it 'return unsucessful take off due to bad weather message' do
      expect(plane.unsucessful_take_off_bad_weather(plane)).to eq "Weather is not good, #{plane} cannot take off"
    end
  end
  describe '#unsucessful_land_bad_weather' do
    it 'return unsucessful land due to bad weather message' do
      expect(plane.unsucessful_land_bad_weather(plane)).to eq "Weather is not good, #{plane} cannot land"
    end
  end
  describe '#unsucessful_land_hangar_full' do
    it 'return unsucessful land due to hangar full message' do
      expect(plane.unsucessful_land_hangar_full(plane)).to eq "Hangar is full, #{plane} not able to land"
    end
  end

end
