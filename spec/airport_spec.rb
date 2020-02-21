require 'airport'
describe Airport do
  it "lands a plane" do 
    expect { subject.land(Plane.new) }.not_to raise_error
  end 

  it "plane takes off" do
    expect(subject.take_off(Plane.new)).to eq "The plane has taken off"
  end

  it "raises an error when the airport is full" do 
    Airport::CAPACITY.times do
      subject.land(Plane.new)
    end
    expect { subject.land(Plane.new) }.to raise_error
  end
end
