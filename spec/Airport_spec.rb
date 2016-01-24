require 'Airport'

describe Airport do 

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }


  describe '#landing' do

    it 'tells a plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'confirms plane has landed' do
      expect{airport.land(plane)}.to change{airport.landed_planes.length}.by(1)
    end

  describe '#take off' do

    it 'tells a plane to take off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end 

    it 'confirms a plane has taken off' do
      expect{airport.take_off(plane)}.to change{airport.flying_planes.length}.by(1)
    end 

  end 





  end 

end 

