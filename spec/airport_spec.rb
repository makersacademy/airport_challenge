require 'airport'
require 'plane'

describe Airport do

  subject(:airport) {described_class.new}
  let(:plane) {double :plane}


  it 'responds to land method' do
    expect(airport).to respond_to(:land)
  end

  describe '#land' do

    it 'takes one argument' do
      expect(airport).to respond_to(:land).with(1).argument
    end
    it 'lands a plane' do
      expect(plane).to receive(:land)
      airport.land plane
    end
    it 'holds landed planes' do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(airport.planes).to include plane
    end


  end
end
