require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it 'plane is flying by default' do
    expect(plane.flying).to eq true
  end

end
