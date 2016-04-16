require 'plane'

describe Plane do

  let(:plane) {described_class.new}

    it 'responds to is flying?' do
      expect(plane).to respond_to :flying?
    end

    it 'returns true if the plane is flying' do
      expect(plane).to be_flying
    end

end