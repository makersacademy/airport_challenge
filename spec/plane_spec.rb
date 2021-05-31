require 'plane'

describe Plane do

  it { is_expected.to respond_to :travelling }
  it 'creates new plane' do
    expect(subject.travelling).to eq true
  end
end