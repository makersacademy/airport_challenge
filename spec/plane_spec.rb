require 'plane.rb'

describe Plane do

  describe '#land' do
    it { is_expected.to respond_to 'land'}
    it { is_expected.to respond_to 'landed'}
    it 'Should tell you when a plane has landed' do
      subject.land
      expect(subject.landed).to eq true
    end
  end

end
