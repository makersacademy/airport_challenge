require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }
  
  it { expect(airport).to respond_to :planes }

  describe 'landing planes' do

    it 'should add planes after landing' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

  end

end
