require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather)}

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:planes)}
  it {is_expected.to respond_to(:take_off).with(1).argument}

  describe 'creating an airport' do
    it 'allows the creation of an airport' do
      array = []
      array << airport
      expect(array).to eq [airport]
    end
  end

  describe '#land' do
    it 'allows a plane to land' do
      expect(airport.land(plane)).to eq plane
    end
  end

  describe '#planes' do
    it 'allows confirmation that the plane has landed' do
      airport.land(plane)
      expect(airport.planes).to eq plane
    end

    it 'allows confirmation that the plane has left' do
      airport.take_off(plane)
      expect(airport.planes).to eq nil
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      expect(airport.take_off(plane)).to eq nil
    end

    it 'raises an error if weather is stormy' do
      message = "Can't take off due to stormy weather!"
      expect{airport.take_off(plane)}.to raise_error message
    end
  end

    it 'allows the storminess of the weather to be checked' do
      #allow(weather).to receive(:currently).and_return(:stormy)
      weather = double(:weather, currently: :stormy)
      expect(airport.stormy?).to eq true
    end


end
