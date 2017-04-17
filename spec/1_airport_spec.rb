require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane)}
  let(:airport_full_error) {Airport::LAND_FULL_ERROR}
  let(:take_off_stormy_error) {Airport::TAKE_OFF_STORMY_ERROR}
  let(:land_stormy_error) {Airport::LAND_STORMY_ERROR}

  before do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
    allow(Weather).to receive(:stormy?).and_return(false)
  end

  describe 'creating an airport' do
    it 'allows the creation of an airport' do
      array = []
      array << airport
      expect(array).to eq [airport]
    end
  end


  describe '#land' do
    it 'allows a plane to land' do
      airport.land(plane)
      expect(airport.landed_planes).to eq [plane]
    end

    it 'knows if a plane that has been told to land is in the airport' do
      allow(plane).to receive(:land).and_return(airport.land(plane))
      plane.land(airport)
      expect(airport.landed_planes).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.landed_planes).to eq []
    end

    it 'removes the correct plane from the airport after take off' do
      plane2 = double(:plane)
      airport.land(plane)
      airport.land(plane2)
      airport.take_off(plane)
      expect(airport.landed_planes).to eq [plane2]
    end
  end

  describe '#clear_to_land'do
    it {is_expected.to respond_to(:clear_to_land?)}

    it 'responds with true if the weather is clear' do
      expect(airport.clear_to_land?).to eq true
    end

    it 'responds with true if the weather is stormy' do
      allow(Weather).to receive(:stormy?).and_return(true)
      expect(airport.clear_to_land?).to eq false
    end
  end



  describe '#capactiy' do
    it {is_expected.to respond_to(:capacity)}

    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows multiple planes to be in the airport' do
      2.times{airport.land(plane)}
      expect(airport.landed_planes).to eq [plane, plane]
    end
  end

  describe '#update_capacity' do
    it 'has the ability to update the capacity' do
      airport.update_capacity(Airport::DEFAULT_CAPACITY + 50)
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY + 50
    end

    it 'will prevent the updated capacity from being breached' do
      airport.update_capacity(Airport::DEFAULT_CAPACITY + 50)
      (Airport::DEFAULT_CAPACITY + 50).times{airport.land(plane)}
      expect{airport.land(plane)}.to raise_error airport_full_error
    end
  end

  context 'If the weather is stormy' do

    before {allow(Weather).to receive(:stormy?).and_return(true)}

    it 'prevents take off in stormy weather' do
      expect{airport.take_off(plane)}.to raise_error take_off_stormy_error
    end

  end

  context 'If the airport is at capacity' do

    it 'prevents landing' do
      Airport::DEFAULT_CAPACITY.times{airport.land(plane)}
      expect {airport.land(plane)}.to raise_error airport_full_error
    end
  end

end
