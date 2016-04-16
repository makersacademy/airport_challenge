require 'plane'

describe Plane do
    it { is_expected.to respond_to :land }

    it { is_expected.to respond_to :landed? }

    it 'is expected to respond to #landed with true if landed' do
subject.land
      expect(subject.landed?).to eq true
    end


end
