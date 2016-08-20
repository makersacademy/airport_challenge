require 'plane'

describe Plane do

  describe '#landed?' do

    it {is_expected.to respond_to(:landed?)}

    it 'confirms plane has landed' do
      expect(subject.landed?).to eq true
    end

  end


end
