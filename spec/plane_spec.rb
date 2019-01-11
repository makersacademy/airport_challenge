require 'plane'
require 'airport'

describe Plane do

  it { is_expected.to respond_to(:location) }

  describe '#location' do

    it 'should default to flying' do
      expect(subject.location).to eq "flying"
    end

  end

end
