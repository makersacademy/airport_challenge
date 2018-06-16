## issues to work through

### infinite take offs DEFENDED
* once landed, the same plane can take off again and again
* need take off to fail if plane is already airborne

### land method returns false
* need to change this

### doesn't work if there are two planes
* need to add an argument to the take_off method to specify which plane is being released

### single responsibility principle
* my take off and landing methods are each doing quite a lot of stuff!

### capacity
* think about creating an array to deal with capacity requirement in user stories

### weather???

-----------------------------
Question about deleting tests
-----------------------------

Initially I want #land(plane) to instantiate a plane variable under the Airport class

TEST1:
describe '#land' do
  it "should land a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
end

PRODUCTION1:
def land(plane)
  @plane = plane
end

=> Code passes, hooray

---------------

Later I want #land(plane) to set the plane's @flying variable (under the Plane class) to false as plane is on the ground

TEST2:
describe '#land' do
  it "should land a plane" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
  it "should mark the plane as grounded" do
    plane = Plane.new
    subject.land(plane)
    expect(plane.flying).to eq false
  end
end

PRODUCTION2:
def land(plane)
  @plane = plane
  @plane.flying = false
end

=> first test fails, second one passes

Is first test superceded by second test, if so was it ok to delete it? (Same thing happened with take_off when adding in additional functionality)

==========> got around this by moving the .flying test to another part of the spec (which makes sense as it's actually a different method, just being called here)
