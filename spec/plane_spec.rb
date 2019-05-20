require 'plane'

describe 'plane' do
  let(:plane) {Plane.new}
  it 'can create instance of plane' do
    #arrange
    #assertion
    expect(plane).to be_an_instance_of(Plane)
  end
end
