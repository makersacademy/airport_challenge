require 'plane'

describe Plane do
  it 'Should have an plane class' do
    expect(subject).to be_instance_of(Plane)
  end

  describe '#in_air' do
    it 'Should have planes in_air value set as true' do
      expect(subject.in_air).to eq true
    end
  end

  describe '#grounded' do
    it 'Should return in_air as false' do
      expect(subject.grounded).to eq(false)
    end
  end
end
