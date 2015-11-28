require 'plane'

describe Plane do
  it {is_expected.to respond_to (:flying?)}

  it 'tells us a plane is not flying after it has landed' do
    plane = Plane.new
    plane.land
    expect(plane.flying?).to eq false

  end

end
