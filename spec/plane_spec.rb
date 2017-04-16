require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  let(:airport) { double(:airport, land: nil) }



  describe 'landed?' do 
    it 'has landed at the airport' do
      plane.land
      expect(plane.landed?).to eq true
      expect(plane.flying?).to eq false
    end
  end
  
  describe '#land' do
    it "has landed at the airport" do
      plane.land
      expect(plane.landed?).to eq true
    end
  end

  describe '#take_off' do
    it "has taken_off from the airport" do  
      plane.land
      plane.take_off
      expect(plane.flying?).to eq true
    end
  end
end