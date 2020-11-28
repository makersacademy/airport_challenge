require 'plane'

describe Plane do
  let(:plane) { described_class.new }

  it 'responds to .in_air' do
    expect(subject).to respond_to(:in_air)
  end

end
