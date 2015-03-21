require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do

  it 'has a flying status when created' do
    expect(subject.status).to eq 'flying'
  end

  it 'can be asked to take off' do
    expect(subject).to respond_to :take_off
  end

  it 'can be told it has touched down and update its status to reflect' do
    subject.touch_down
    expect(subject.status).to eq 'landed'
  end

  it 'when asked to take off plane will change status' do
    subject.touch_down
    subject.take_off
    expect(subject.status).to eq 'flying'
  end

  xit 'can take off'

  xit 'changes its status to flying after taking off'

end
