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
      allow(plane).to receive(:report_landed)
      airport.land(plane)
      expect(airport.landed_planes).to eq plane
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

    it 'prevents take off in stormy weather' do
      allow(Weather).to receive(:stormy?).and_return(true)
      message = "Can't take off in storm"
      expect{airport.take_off(plane)}.to raise_error message
    end

  end



end
