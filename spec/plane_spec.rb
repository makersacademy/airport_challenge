require 'plane'
require 'airport'

describe Plane do

  before do
    @heathrow = Airport.new
    @concorde = Plane.new
  end

  it 'sets up instance variables correctly' do
    expect(subject.status).to eq "flight in progress"
    expect(subject.airport).to eq nil
  end

  it 'should be able to confirm it\'s status' do
    expect(subject.confirm_status).to eq "Plane status:  flight in progress"
  end

  describe 'landing at an airport' do

    it {should respond_to :land}

    it 'should be be visible as landed at the airport' do
      @concorde.land(@heathrow)
      expect(@heathrow.planes[0]).to eq @concorde
    end

    it 'should change it\'s status to landed' do
      @concorde.land(@heathrow)
      expect(@concorde.status).to eq "landed"
    end

    it 'should know which airport it has landed at' do
      @concorde.land(@heathrow)
      expect(@concorde.airport).to eq @heathrow
    end
  end

  describe 'taking off from an airport' do

    it {should respond_to :take_off}

    it 'should be visible as having left an airport' do
      @concorde.land(@heathrow)
      @concorde.take_off
      expect(@heathrow.planes).to eq []
    end

    it 'should change it\'s status to flight in progress' do
      @concorde.land(@heathrow)
      @concorde.take_off
      expect(@concorde.status).to eq "flight in progress"
    end

    it 'should change it\'s airport to nil' do
      @concorde.land(@heathrow)
      @concorde.take_off
      expect(@concorde.airport).to eq nil
    end
  end

end
