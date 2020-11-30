require 'plane'

describe Plane do
  let(:airport) { Airport.new }
  
  it 'cannot take off or be in the airport if already flying' do
    subject.location = "air"
    expect { airport.takeoff(subject) } .to raise_error(RuntimeError, 'the plane is not in the airport') 
  end

end
