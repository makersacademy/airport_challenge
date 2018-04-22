require 'plane'

describe Plane do
  it 'responds to status method' do
    expect(subject).to respond_to(:flying?)
  end

  describe '#flying?', :flying? do
    it 'returns true' do
      expect(subject.flying?).to eq true
    end
  end

  describe '#take_flight' do
    it 'returns true' do
      expect(subject.take_flight).to eq true
    end
  end

  describe '#ground' do
    it 'returns false' do
      expect(subject.ground).to eq false
    end
  end
end
