require 'airport'

describe Airport do
  it { is_expected.to respond_to :instruct_land }
  it { expect(subject).to respond_to(:instruct_land).with(1).argument }
  it { is_expected.to respond_to :instruct_takeoff }
  it { expect(subject).to respond_to(:instruct_takeoff).with(1).argument }
end
