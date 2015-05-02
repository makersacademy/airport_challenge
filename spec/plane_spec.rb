require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do

  it 'has a flying status when created' do
    expect(subject).to be_flying
  end

  xit 'has a flying status when in the air'
  # I have no idea how to differentiate this from the other tests
  # Somehow test that any plane not landed shows as flying?
  # Maybe test that not(landed) implies flying?!
  # I'm going to leave it as tautologous for now, maybe poke again later

  it 'can take off' do
    #Need to use a double for the airport?!?!
    #We can create dummy methods and responses for each double
    #e.g. depo = double(:depo, { request_clean: true })
    #or allow(depo).to receive(:request_clean).and_return(true)
    #or expect(depo).to receive(:request_clean).and_return(true) to enforce an expectation that the method is called at some point in the test!
    #airport = double(:airport { weather_check: "sunny"})
    airport = double(:airport)
    allow(airport).to receive(:land).and_return(true)
    subject.land airport
    expect { subject.launch }.not_to raise_error
    # Weather is handled by airport, so doubling airport.land bypasses capacity and weather
  end

  it 'changes its status to flying after taking off' do
    #Need to use a double for the airport?!?!
    #airport = double(:airport { weather_check: "sunny", space: true})
    airport = double(:airport)
    allow(airport).to receive(:land).and_return(true)
    allow(airport).to receive(:launch).and_return(true)
    subject.land airport
    subject.launch
    expect(subject).to be_flying
  end

  it 'cannot land at an airport when it is already landed' do
    airport = double(:airport)
    allow(airport).to receive(:land).and_return(true)
    subject.land airport
    expect {subject.land airport}.to raise_error('Already landed!')
  end

  it 'cannot launch if it is already flying' do
    expect {subject.launch}.to raise_error('Already flying!')
  end
  
end
