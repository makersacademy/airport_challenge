require 'plane'

describe Plane do
  it 'responds to the method land' do
    plane = Plane.new
    expect(plane).to respond_to :land
  end
  # One line alternative to the test above is on the line below. Note that don't need to instantiate plane = Plane.new with one line syntax.
  # it { is_expected.to respond_to :land }

  it 'confirms a plane has landed' do
    plane = Plane.new
    expect(plane.land).to eq "Plane has landed at airport."
  end

end
