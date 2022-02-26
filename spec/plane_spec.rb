require 'plane'

describe Plane do
  it 'creates a new plane object' do
    plane = Plane.new
  end

  describe '#taken_off?'
  it { is_expected.to respond_to :taken_off? }

  it 'confirms the plane has taken off' do
    expect(subject.taken_off?).to eq true
  end
end
