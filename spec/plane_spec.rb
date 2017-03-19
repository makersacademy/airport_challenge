require 'plane'

describe Plane do
let(:plane) { subject }

  it 'landed' do
    expect(plane.landed?).to eq true
  end


end
