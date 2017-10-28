require 'plane'

describe Plane do

  subject(:plane) { Plane.new }

  describe 'plane has adequate status information' do
    it 'initializes with status set to flying' do
      expect(plane.status).to eq "flying"
    end
  end

end
