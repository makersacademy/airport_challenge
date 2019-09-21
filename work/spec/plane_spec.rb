require 'plane'

describe Plane do
  it 'exists' do
    expect(subject.class).to eq Plane
  end

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:takeoff) }
end
