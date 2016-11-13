require 'plane'

describe Plane do

  describe '#landed?' do
    it { is_expected.to respond_to 'landed?' }
  end

  it 'returns true when plane has landed' do
    subject.land=(true)
    expect(subject.landed?).to eq true
  end

  it 'returns false when plane has not landed' do
    subject.land=(false)
    expect(subject.landed?).to eq false
  end

end
