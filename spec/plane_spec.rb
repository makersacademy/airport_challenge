require './plane.rb'

describe Plane do
  it 'has a randomised id for the plane' do
    test = Plane.new(1234)
    expect(test.plane_id_number).to eq(1234)
  end

end
