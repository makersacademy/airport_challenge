require 'plane.rb'

describe Plane do 

  it { is_expected.to respond_to(:land) } 

  describe '#land' do
    it 'lands a plane' do
      expect(subject.land).to eq(:landed)
    end
  end

  it { is_expected.to respond_to(:take_off) } 

  describe '#take_off' do
    it 'allows plane to take off' do
      expect(subject.take_off).to eq(:flying)
    end
  end
end
