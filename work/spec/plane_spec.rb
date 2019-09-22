require 'plane'

describe Plane do
  it 'exists' do
    expect(subject.class).to eq Plane
  end

  it { is_expected.to respond_to(:landed) }

  it { is_expected.to respond_to(:taken_off) }

end
