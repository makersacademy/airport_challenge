require 'airport'
require 'weather'

describe Airport do

  subject(:airport) {Airport.new}

  it 'clears plane for take off' do
    expect(airport).to respond_to :clear?
  end

  describe '#clear' do

    it 'checks the weather' do
      allow(airport.weather).to receive(:rand).with(0..9) {9}
      expect(airport.clear?).to be_falsy
    end

  end
  
end