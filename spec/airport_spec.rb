require './lib/airport'

describe Airport do
  it "should be of class Airport" do
    expect(subject).to be_an_instance_of Airport
  end

  it "should accept planes" do
    expect(subject).to respond_to :accept_plane
  end

  it 'accepts a plane landing' do
    plane = Plane.new
    expect(subject.accept_plane(plane)).to be_a Plane
  end
end
