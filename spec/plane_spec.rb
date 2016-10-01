require 'plane'
require 'airport'

describe Plane do
  it 'sets up instance variables correctly' do
    expect(subject.status).to eq "flight in progress"
  end

  it 'should be able to confirm it\'s status' do
    expect(subject.confirm_status).to eq "Plane status:  flight in progress"
  end

  describe 'landing at an airport' do

    it {should respond_to :land}

    it 'should be be visible as landed at the airport' do
      heathrow = Airport.new
      plane = Plane.new
      plane.land(heathrow)
      expect(heathrow.planes[0]).to eq plane
    end

    it 'should change it\'s status to landed' do
      heathrow = Airport.new
      plane = Plane.new
      plane.land(heathrow)
      expect(plane.status).to eq "landed"
    end
  end

  describe 'taking off from an airport' do

    it {should respond_to :take_off}

    it 'should be visible as having left an airport' do
      heathrow = Airport.new
      plane = Plane.new
      plane.land(heathrow)
      plane.take_off
      expect(heathrow.planes).to eq []
    end

    it 'should change it\'s status to flight in progress' do
      heathrow = Airport.new
      plane = Plane.new
      plane.land(heathrow)
      plane.take_off
      expect(plane.status).to eq "flight in progress"
    end
  end

end
