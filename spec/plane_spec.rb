require 'plane'

describe Plane do
  it { is_expected.to respond_to :status}
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :takeoff}

  describe '#land' do
    it 'is able to land' do

    end

    it 'can not land when the weather is stormy' do

    end
  end

  describe '#takeoff' do
    it 'is able to takeoff' do

    end

    it 'can not take off when the weather is stormy' do

    end
  end

  describe '#status' do
    it 'can report it\'s current status' do

    end
  end

end
