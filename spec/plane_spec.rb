require 'plane'

describe Plane do 

  it "is created as a flying plane" do
  	expect(subject.flying?).to be true
  end
	
  it "changes status when landing" do
  	subject.land
  	expect(subject.flying?).to be false
  end

  it "changes status when taking off" do
  	subject.land
  	subject.take_off
  	expect(subject.flying?).to be true
  end


end