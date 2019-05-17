require 'plane'

describe Plane do

  let(:plane) { Plane.new }

  it 'sets the plane to flying when its created' do
    expect(plane.flying).to eq(true)
  end

end
