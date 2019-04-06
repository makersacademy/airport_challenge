require 'airport'

describe Airport do
  subject { described_class.new }
  let(:plane) { double(:plane) }

  describe '#land' do
    it { expect(subject.land(:plane)).to eq :plane }
  end

end
