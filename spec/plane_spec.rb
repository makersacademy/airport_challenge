require 'plane'

describe Plane do

  it 'creates an instance of the Plane class' do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end

  it { is_expected.to respond_to(:in_air?) }

  it 'can reveal location status' do
    plane = Plane.new
    expect(plane.in_air?).to eq true
  end

end
