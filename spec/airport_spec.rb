require 'airport.rb'

describe Airport do

  it "instructs plane to land" do
    plane = Plane.new
    expect(subject.land(plane)).to be_landed
  end

  it "instructs a plane to take off" do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane.instance_variable_get(:@landed)).to eq false

  end

  # it "no take off in storms" do
  #   expect { subject.take_off}.to raise_error "Too stormy"
  # end

end
