require 'plane'

describe Plane do

  it 'should know when it is flying' do
    plane = Plane.new
    expect(plane.status).to eq "Flying"
  end
  
end
