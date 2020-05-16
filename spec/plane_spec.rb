require_relative '../lib/plane'

describe Plane do
  let(:plane) { Plane.new }

  it { is_expected.to respond_to :take_off }

  it 'should check whether it is in flight before taking off' do
    airport = Airport.new
    airport.land(plane)
    expect(plane.flying?).to eq false
  end

end
