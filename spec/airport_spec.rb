require 'airport'

describe Airport do

  it " allows planes to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end 
  it "takes off from an airport" do
    subject.take_off
    expect(subject.take_off).to eq "Plane has taken off"
  end

end
