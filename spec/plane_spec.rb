require 'plane'
describe Plane do
  it "returns an instance of Plane" do
    expect(Plane.new('Rome')).to be_an_instance_of(Plane)
  end
  it "responds to land" do
    plane = Plane.new('Rome')
    expect(plane).to respond_to(:land)
  end
  it "responds to take_off" do
    plane = Plane.new('Rome')
    expect(plane).to respond_to(:take_off)
  end
  it "returns true while landing" do
    plane = Plane.new('Rome')
    plane.is_flying = true
    expect(plane.land('LCY')).to be true
  end 
  it "raises a RuntimeError while landing to the same location" do
    plane = Plane.new('FCO')
    plane.is_flying = true
    expect { plane.land('FCO') }.to raise_error RuntimeError
  
  end
  it "raises a RuntimeError while landing when it's not flying" do
    plane = Plane.new('Rome')
    plane.is_flying = false
    expect(plane.land('LCY')).to be false
  end

end
