require 'plane'
require 'airport'

describe Plane do

  let(:plane) { Plane.new }

  it 'responds to method #landing?' do
    expect(plane).to respond_to(:landed?)
  end

  it 'confirms that the plane has landed' do
    expect(plane.landed?).to eq(true)
  end

end
