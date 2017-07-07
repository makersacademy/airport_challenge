require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it 'lands something' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

  it { is_expected.to respond_to(:plane) }
  it 'confirms that a plane has landed' do 
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end
end
