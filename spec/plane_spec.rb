require 'plane'

describe Plane do

  it { is_expected.to respond_to(:flying?) }

  it 'knows if it is flying' do
    expect(subject.flying?).to eq true
    subject.land
    expect(subject.flying?).to eq false
  end
end
