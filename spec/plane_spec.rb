require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  let(:airport) { double :airport }

  it { is_expected.to respond_to :landed }
  it { is_expected.to respond_to :taken_off }
  it { is_expected.to respond_to :status }

  it 'confirms plane has landed' do
    plane.landed
    expect(plane.status).to be false
  end

  it 'confirms plane has taken off' do
    plane.taken_off
    expect(plane.status).to be true
  end

end
