require "plane"

describe Plane do 
  it "lands a plane" do 
    expect(subject).to respond_to(:land)
  end

  it "instructs a plane to take off" do 
    expect(subject).to respond_to(:take_off)
  end 

  it "confirms that plane is flying" do 
    subject.take_off()
    expect(subject.flying?).to eq true
  end

  it "ensures that flying plane cannot take off" do 
    subject.take_off()
    expect { subject.take_off() }.to raise_error "Plane is already flying"
  end

  it "ensures that landed plane cannot land again" do 
    expect { subject.land() }.to raise_error "Plane is already landed"
  end

end
