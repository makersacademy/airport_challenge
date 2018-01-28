require 'plane'

describe Plane do

  it { is_expected.to respond_to(:flying?) }

  it 'knows if it is flying' do
    subject.land
    expect(subject.flying?).to eq false
    subject.fly
    expect(subject.flying?).to eq true
  end
end
