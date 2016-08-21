require 'airport.rb'

describe Airport do

  it "instructs plane to land" do
    expect(subject.land).to be_landed
  end

  it "instructs a plane to take off" do
    plane = subject.take_off
    expect(plane.instance_variable_get(:@landed)).to eq false

  end

#   it "prevent take_off when stormy" do
#   expect { subject.take_off }.to raise_error "Take off cancelled, too stormy"
# end

end
