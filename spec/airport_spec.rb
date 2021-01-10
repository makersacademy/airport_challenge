require "airport"

describe Airport do

  it "should have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "should have an airplane array" do
    expect(subject.airplanes).to eq Array.new
  end

  describe "initialization" do
    subject { Airport.new }
    let(:airplane) { Airplane.new }
     
    it "defaults capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(airplane)
      end

      expect { subject.land(airplane) }.to raise_error "Airport is full"

    end
  end

  describe "#land" do
    
    it { is_expected.to respond_to :land }

    it "instructs the plane to land at the airport" do
      airplane = Airplane.new
      expect(subject.land(airplane)).to eq [airplane]
    end 

    it "raises an error when airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(Airplane.new) }
      expect { subject.land Airplane.new }.to raise_error "Airport is full"
    end

  end

  describe "#take_off" do

    it { is_expected.to respond_to :take_off }
    
    it "instructs the plane to take off from the airport" do
      airplane = Airplane.new
      subject.land(airplane)
      expect(subject.take_off).to eq airplane
    end

    it "should not instruct a plane to take off if a plane is not at the airport" do
      expect { subject.take_off }.to raise_error "No airplanes at airport"
    end
  end

end
