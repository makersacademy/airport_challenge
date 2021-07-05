require "airport"

describe Airport do
  it "Will create an instance of Airport" do
     expect(subject).to be_instance_of(Airport)
  end

  it "Will allow a plane to land in the airport" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "Will allow a plane to take off from the airport" do
    expect(subject).to respond_to(:take_off)
  end
  
  it "Will confirm a plane that has taken off is no longer in the airport" do
    subject.empty?
    expect {subject.take_off}.to raise_error "Airport empty; cannot take off."
  end
  
  describe "#land" do
    it "Will prevent landing if airport is full" do
      plane = Plane.new
      subject.capacity.times {subject.land double(:plane)}
      expect {subject.land double(:plane)}.to raise_error "Airport full; cannot land plane."
    end
  end

  it "Will have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#initialization" do
      subject { Airport.new }
      let(:plane) { Plane.new }
      it "Has a default capacity" do
        described_class::DEFAULT_CAPACITY.times do
          subject.land double(:plane)
        end 
        expect { subject.land double(:plane)}.to raise_error "Airport full; cannot land plane."
    end
  end
end