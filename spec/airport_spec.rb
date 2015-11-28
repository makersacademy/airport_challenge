require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather)}

  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:landed_planes)}
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
      allow(plane).to receive(:report_landed)
      airport.land(plane)
      expect(airport.landed_planes).to eq plane
    end
  end



  describe '#take_off' do
    it 'allows a plane to take off' do
      allow(plane).to receive(:report_landed)
      allow(plane).to receive(:report_taken_off)
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.landed_planes).to eq nil
    end


  end



end
