require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane1) {double :plane}

  describe 'tests that need to call #land on a plane double' do
    before do
      allow(plane1).to receive(:land).and_return(plane1)
    end

    it 'instructs a plane to land at an airport' do
      expect(airport.land(plane1)).to eq plane1
    end

    it 'confirms that the plane has landed' do
      airport.land(plane1)
      expect(airport.plane).to eq plane1
    end

  end

  it {is_expected.to respond_to(:take_off).with(1).argument}

  describe 'tests that need to call #take_off on a plane double' do
    before do
      allow(plane1).to receive(:take_off).and_return(nil)
    end

    it 'instructs plane to take off from airport' do
      airport.land(plane1)
      expect(airport.take_off(plane1)).to eq nil
    end

    it 'confirms that plane is no longer in the airport' do
      airport.land(plane1)
      airport.take_off(plane1)
      expect(airport.plane).to eq nil
    end

  end

end
