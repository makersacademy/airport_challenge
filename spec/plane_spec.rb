require 'plane.rb'

describe Plane do

  let(:plane) {Plane.new}

  describe '#land' do
    before do
      plane.land
    end

    it 'has a status of \'grounded\' when plane has landed' do
      expect(plane.status).to eq "grounded"
    end
  end

  describe '#takeoff' do
    before do
      plane.takeoff
    end

    it 'has a status of \'flying\' when plane has taken off' do
      expect(plane.status).to eq "flying"
    end
  end
end
