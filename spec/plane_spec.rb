require 'plane'

describe Plane do
  it { is_expected.to respond_to :status}
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :takeoff}

  describe '#land' do
    it 'changes status when landing' do

    end
  end

  describe '#takeoff' do
    it 'changes status when taking off' do

    end
  end

  describe '#status' do
    it 'can report it\'s current status' do

    end
  end

end
