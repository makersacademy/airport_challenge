require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to :instruct_landing }
  it { is_expected.to respond_to :instruct_take_off }
  
  it "has a defualt capacity" do
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it "default capacity can be overwritten for new airports" do
    london_heathrow = Airport.new(50)
    expect(london_heathrow.capacity).to eq 50
  end

  describe "#instruct_landing" do
    it "raises an error if the airport is full" do
      subject.capacity.times { subject.instruct_landing(Plane.new) }
      expect { subject.instruct_landing(Plane.new) }.to raise_error "AIRPORT AT FULL CAPACITY!"
    end
  end

  describe "#instruct_take_off" do
    it "can instruct a plane to take_off" do
      my_plane = Plane.new
      subject.instruct_landing(my_plane)
      expect(subject.instruct_take_off).to eq(my_plane)
    end
  end
end
