require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  let(:airport) { double :airport }

  it 'creates a new instance' do
    expect(subject).to be_a Plane
  end

  it "responds to #landed?" do
    expect(subject).to respond_to(:landed?)
  end
end
