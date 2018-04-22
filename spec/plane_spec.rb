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
end
