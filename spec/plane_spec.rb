require 'plane.rb'

describe Plane do
  let(:airport) { double :airport }

  describe 'clearance?' do
    it 'can check if clearance from the airport is true or false' do
      subject.clearance
      expect(subject.clearance).to eq false
    end
  end

end
