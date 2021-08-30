require "plane"

describe Plane do
  it { is_expected.to respond_to :ready_to_land }

  it 'plane ready to land' do
    expect(subject.ready_to_land).to eq true
  end
end
