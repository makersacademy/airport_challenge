require 'plane'

describe Plane do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it { is_expected.to respond_to :landed }

  it 'is not landed by default' do
    expect(subject.landed).to eq false
  end
end
