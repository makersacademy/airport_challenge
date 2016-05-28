require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }

  describe 'respond and initiate' do
    it "responds to a method"do
      expect(airport).to respond_to(:land).with(1).argument
      expect(airport).to respond_to(:depart).with(1).argument
      expect(airport).to respond_to(:plane)
    end

    it "can initialize a new airport" do
      expect(airport).to be_a(Airport)
    end
  end

  describe '#land' do
    it "raises an error when airport is full" do
      Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error "Airport is full"
    end
  end

  describe '#depart' do
    it 'raises an error when there are no planes to depart' do
      expect { airport.depart(Plane.new) }.to raise_error "No planes at airport"
    end
  end

  # it 'confirms landing' do
  #   plane = Plane.new
  #   expect { (airport.land(plane)) }.to output("Plane has landed\n").to_stdout
  # end
  #
  # it 'confirms departure' do
  #   plane = Plane.new
  #   expect { (airport.depart(plane)) }.to output("Plane has departed\n").to_stdout
  # end


end
