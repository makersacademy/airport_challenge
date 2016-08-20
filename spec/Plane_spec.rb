require 'Plane.rb'

describe Plane do
  let(:airport) {double :airport}
  let(:weather) {double :weather}

  before(:each) do
    allow

  end

  describe '.land_at' do
    it 'allows planes to land at a specific Airport' do
      allow(weather).to receive(:stormy?).and_return(false) # this means weather is good
      subject.land_at(airport)
      expect(subject.location) to eq(airport)
    end
  end


end
