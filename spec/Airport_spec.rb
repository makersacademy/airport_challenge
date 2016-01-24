require 'Airport'

describe Airport do 

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }


  describe '#landing' do

    it 'tells a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'confirms plane has landed' do
      airport.land(plane)
      expect(airport.landed_planes).to include(plane)
    end




  end 

end 

