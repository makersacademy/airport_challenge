require 'plane'

describe Plane do
  it 'Should have an plane class' do
    expect(subject).to be_instance_of(Plane)
  end

  describe '#land' do
    it 'Should respond to land' do
      expect(subject).to respond_to(:land)
    end
  end
end
