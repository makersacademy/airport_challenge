require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather)}

  describe 'creating an airport' do
    it 'allows the creation of an airport' do
      array = []
      array << airport
      expect(array).to eq [airport]
    end
  end

  describe '#land' do
    it 'allows a plane to land' do
      allow(Weather).to receive(:stormy?).and_return(false)
      allow(plane).to receive(:report_landed)
      airport.land(plane)
      expect(airport.landed_planes).to eq [plane]
    end
  end


  describe '#take_off' do
    it 'allows a plane to take off' do
      allow(plane).to receive(:report_landed)
      allow(plane).to receive(:report_taken_off)
      allow(Weather).to receive(:stormy?).and_return(false)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.landed_planes).to eq nil
    end
  end

  describe '#capactiy' do
    it {is_expected.to respond_to (:capacity)}

    it 'has a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows multiple planes to be in the airport' do
      allow(plane).to receive(:report_landed)
      allow(Weather).to receive(:stormy?).and_return(false)
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
      allow(plane).to receive(:report_landed)
      allow(Weather).to receive(:stormy?).and_return(false)
      airport.update_capacity(Airport::DEFAULT_CAPACITY + 50)
      (Airport::DEFAULT_CAPACITY + 50).times{airport.land(plane)}
      message = "Can't land, the airport is full"
      expect{airport.land(plane)}.to raise_error message
    end
  end

  context 'IF THERE IS A STORM' do

    it 'prevents take off in stormy weather' do
      allow(plane).to receive(:report_taken_off)
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Can't take off in storm"
      expect{airport.take_off(plane)}.to raise_error message
    end

    it 'prevents planes from landing if stormy' do
      allow(plane).to receive(:report_landed)
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Can't land in storm"
      expect{airport.land(plane)}.to raise_error message
    end

  end

  context 'IF THE AIRPORT IS FULL' do

    it 'prevents landing' do
      allow(plane).to receive(:report_landed)
      allow(Weather).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times{airport.land(plane)}
      message = "Can't land, the airport is full"
      expect {airport.land(plane)}.to raise_error message
    end
  end

  end
