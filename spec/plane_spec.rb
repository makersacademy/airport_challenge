require 'plane'

describe Plane do 

  it "is created as a flying plane" do
  	expect(subject.is_flying?).to be true
  end
	
  it "changes status when landing" do
  	subject.land
  	expect(subject.is_flying?).to be false
  end

  it "changes status when taking off" do
  	subject.land
  	subject.take_off
  	expect(subject.is_flying?).to be true
  end


end