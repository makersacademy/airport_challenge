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

  context 'it can' do

    it 'land' do
      heathrow = Airport.new
      heathrow.land(subject)
      expect(subject::status).to eq "landed"
    end

    it 'has a flying status when created' do
      expect(subject::status).to eq "flying"
    end

    it 'has a flying status when in the air' do
      expect(subject::status).to eq "flying"
    end

    it 'take off' do
      heathrow = Airport.new
      heathrow.land(subject)
      expect(heathrow).to respond_to(:take_off).with(1).argument
    end

    it 'change its status to flying after taking off' do
      heathrow = Airport.new
      heathrow.land(subject)
      heathrow.take_off(subject)
      expect(subject::status).to eq "flying"
    end
  end

  context "it can't" do

    it 'land when the airport is full' do
      heathrow = Airport.new
      2.times {heathrow.land(subject)}
      expect {heathrow.land(subject)}.to raise_error 'The airport is full'
    end

    it 'land when the airport is full with extended capacity' do
      heathrow = Airport.new(10)
      10.times {heathrow.land(subject)}
      expect {heathrow.land(subject)}.to raise_error 'The airport is full'
    end
  end
end
