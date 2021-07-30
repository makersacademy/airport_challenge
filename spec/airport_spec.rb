require 'airport'

describe Airport do
  
  it { is_expected.to be_a Airport }

  it "has a hangar array to store planes" do
    expect(subject.hangar).to be_a Array
  end

  it "stores a plane in hangar after landing" do 
    Plane.new.land(subject)
    expect(subject.hangar.size).to eq 1
  end

  it "can confirm a plane is at the airport" do
    plane = Plane.new
    plane.land(subject)
    expect(subject.parked?(plane)).to be true
  end

  it "can confirm a plane is no longer at the airport" do
    plane = Plane.new
    plane.land(subject)
    plane.take_off(subject)
    expect(subject.parked?(plane)).to be false
  end

end
