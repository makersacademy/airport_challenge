require 'airport'

describe Airport do

  subject(:airport) {described_class.new(10)}

  it {is_expected.to respond_to(:land)}

  it 'confirms plane has landed after landing' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes).to eq [plane]
  end

  it 'raise an error if landing more planes than the capacity' do
    expect {11.times{subject.land(Plane.new)}}.to raise_error("The airport is full")
  end

  it 'confirm plane has taken off after takeoff' do
  plane = Plane.new
  subject.take_off(plane)
  expect(subject.planes).to eq []
  end
end
