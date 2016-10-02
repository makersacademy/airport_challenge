require 'plane'
require 'airport'
require 'croissant'

describe Plane do

  before do
    @heathrow = Airport.new
    @concorde = Plane.new
    allow(@heathrow).to receive(:weather_index).and_return 0
  end

  it 'sets up instance variables correctly' do
    expect(subject.status).to eq "flight in progress"
    expect(subject.airport).to eq nil
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

  describe 'in an edge case scenario' do
    it 'should not be able to take off if already in flight' do
      expect {@concorde.take_off}.to raise_error "This plane is already in flight"
    end
    it 'should not be able to land if it is at another airport' do
      @concorde.land(@heathrow)
      expect {@concorde.land(Airport.new)}.to raise_error "This plane is not in flight"
    end
    it 'should not be able to land on a croissant' do
      expect {@concorde.land(Croissant.new)}.to raise_error "A Croissant is not an airport"
    end
  end

end
