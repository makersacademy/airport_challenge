require 'plane'

describe Plane do

  it { is_expected.to respond_to(:landed?) }

  context 'when instructed to land' do

    it 'is landed' do
      subject.land
      expect(subject.landed?).to be true
    end
  end
end