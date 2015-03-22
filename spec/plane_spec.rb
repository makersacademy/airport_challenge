require 'plane'
# When we create a new plane, it should have a "flying" status,
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status
# should become "flying"

describe Plane do

  it 'has status "flying" when created' do
    expect(subject).to be_flying
  end

  it 'can be assigned a flight number' do
    expect(subject).to respond_to :flight_number
  end

  it 'can land' do
    expect(subject).to respond_to :land
  end

  it 'does not have "flying" status after landing' do
    subject.land
    expect(subject).not_to be_flying
  end

  it 'can take off' do
    expect(subject).to respond_to :take_off
  end

  it 'has a flying status after taking off' do
    # could do subject.land but then test is dependent on that method working
    class Plane; attr_writer :flying; end
    subject.flying = false
    subject.take_off
    expect(subject).to be_flying
  end
end
