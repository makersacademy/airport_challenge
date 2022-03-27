require_relative '../lib/plane.rb'

describe Plane do
  
  describe '#flying?' do
    it { is_expected.to respond_to :flying? }

    it 'should return true if plane is flying' do
      expect(subject.flying?).to be_truthy
    end
  end
end