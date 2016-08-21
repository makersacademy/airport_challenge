require 'plane'

describe Plane do
  it { is_expected.to respond_to :landed? }

  describe 'initialize' do
    it 'instatiates planes as not currently landed' do
      expect(subject.landed?).to eq false
    end
  end
end
