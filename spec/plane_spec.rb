require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Should I have an air class, which contains planes when they're in the air?
# Otherwise they just vanish (or rather they still exist, but aren't located)
# anywhere

# Should I have the plane's flying variable only be able to be set by airport?
# Otherwise it will be able to be manipulated into flying in a non-standard way

describe Plane do

  it 'has a flying status when created' do
    expect(subject.flying?).to be true
  end

  # not really sure what this test would do
  # xit 'has a flying status when in the air'

  it 'can land, and change its status' do
    subject.land!
    expect(subject.flying?).to be false
  end

  xit 'has a landed status when in the airport'

  it 'cannot land when it is already landed' do
    subject.land!
    expect { subject.land! }.to raise_error 'Already Landed'
  end

  it 'can take off and change its status to flying' do
    subject.land!
    subject.take_off!
    expect(subject.flying?).to be true
  end

  xit 'changes its status to flying after taking off'

  it 'cannot take off when it is already flying' do
    expect { subject.take_off! }.to raise_error 'Already Flying'
  end
end

# Completed Features:
# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
### Debatable, I made it return false to the @flying variable
#
# When the plane takes of from the airport, the plane's status
# should become "flying"
