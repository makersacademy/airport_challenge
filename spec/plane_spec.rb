require 'plane'

RSpec.describe 'Plane can be created' do

  it 'should create a plane' do
    plane = Plane.new
    expect(plane).not_to be_nil
  end

end