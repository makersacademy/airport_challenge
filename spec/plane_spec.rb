require 'plane'
require 'airport'

describe Plane do

  let(:plane) { Plane.new }

  it 'responds to method #landing?' do
    expect(plane).to respond_to(:landed?)
  end

end
