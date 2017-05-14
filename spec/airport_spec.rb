require 'plane'
require 'airport'
require 'weather'

describe Airport do
  describe 'initalization' do
    it 'defaults capacity' do
      plane = Plane.new
      Weather.any_instance.stub(:rand_number).and_return(5)
      Airport::DEFAULT_CAPACITY.times do
        subject.planes.push(plane)
      end
      expect { plane.land(subject) }.to raise_error "Airport is full, can't land"
    end
  end

  it 'expect every new airport to have the capacity for planes' do
    expect(subject.planes).to eq []
  end

  it 'expect a plane that has landed to exist at the airport' do
    plane = Plane.new
    Weather.any_instance.stub(:rand_number).and_return(5)
    plane.land(subject)
    expect(subject.planes).to include plane
  end

  it 'expect a plane that has not landed to not exist at the airport' do
    plane = Plane.new
    expect(subject.planes).not_to include plane
  end
end
