
require './lib/Airport'
require './lib/Plane'
describe Airport do 
  
  before(:each) { subject.capacity = 48; subject.weather = 'sunny' }
  # class method testing
  describe 'planes' do
    it { expect(subject).to respond_to(:planes) } # there are planes in airport
  end

  describe 'weather' do
    it { expect(subject).to respond_to(:weather) } # the airport has a weather var
  end

  describe 'capacity' do
    it { expect(subject).to respond_to(:capacity) }
  end

  describe 'plane actions' do # using one describe here to allow for usage of objects at local level, not global
    plane = Plane.new
    airport = Airport.new
    before(:each) { airport.weather = 'sunny'; airport.capacity = 48 } # reset weather and capacity each time
    it 'can check if a plane has landed' do
      plane.land(airport)
      expect(airport.planes[-1]).to eq(plane) # one plane in array
    end

    it 'can check if a plane has taken off' do
      plane.take_off(airport)
      expect(airport.planes.length).to eq(0) # now no planes in array
    end

    it 'can prevent take off in bad weather' do # check if exception is raised due to bad weather
      airport.weather = 'stormy'
      expect { plane.take_off(airport) }.to raise_error("cannot take off bad weather") 
    end

    it 'can prevent take off if full' do # check if exception raised if full
      48.times { airport.planes.push(0) } # fill our airport planes array as its used to check capacity
      expect { plane.land(airport) }.to raise_error("cannot land airport full") 
    end

    it 'raises an error when a plane takes off when none are in array' do
      airport.planes.clear # clear our planes array
      expect { plane.take_off(airport) }.to raise_error("cannot take of airport empty")
    end
  end

  describe 'change capacity' do # check to see if capacity can be changed
    it 'can change capacity' do
      10.times do
        new_cap = rand(500_00); subject.capacity = new_cap
        expect { subject.capacity.to eq(new_cap) }
      end
    end
  end

  describe 'multiple take off and landing tests' do
    it 'can land 10 planes' do
      10.times { |_| Plane.new.land(subject) }
      expect(subject.planes.length).to eq(10)
      expect(subject.planes[0] && subject.planes[-1]).to be_a(Plane) 
    end
    it 'can take off 10 planes' do
      10.times do |_| 
        subject.planes.push(Plane.new)       
        subject.planes.each { |p| p.take_off(subject) } 
      end
      expect(subject.planes.length).to eq(0)
    end
    it 'can land 5 planes and take off 3 planes' do
      5.times { |_| Plane.new.land(subject) }
      expect(subject.planes.length).to eq(5)
      3.times { |i| subject.planes[i].take_off(subject) }
      expect(subject.planes.length).to eq(2)
    end
  end
end
