require './lib/airport'

describe Airport do

  # check that airport is an instance of the Airport class
  it "expect airport be an instance of Airport" do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end

  # accepts and releases planes
  it { is_expected.to respond_to :planes }

  # set the capacity
  describe "initialization" do
    it "has a limited capacity" do
      airport = Airport.new(100)
      100.times { airport.dock Plane.new }
      expect { airport.dock Plane.new }.to raise_error(RuntimeError, 'Airport full, cannot accept planes')
    end

    it "sets default capacity of 100" do
      airport = Airport.new
      Airport::DEFAULT_CAPACITY.times { airport.dock Plane.new }
      expect { airport.dock Plane.new }.to raise_error(RuntimeError, 'Airport full, cannot accept planes')
    end

  end

end
