require_relative '../lib/plane'

describe Plane do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to :take_off }

  it 'should check whether it is in flight before taking off' do
    expect(plane.in_flight?).to eq true
  end

end
