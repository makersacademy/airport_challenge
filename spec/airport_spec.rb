require 'airport'

describe Airport do
  let(:airplane) { double :aiplane }

  describe "land_plane" do
    it "instructs airplane to land" do
      airplane = double(:flying => true, :flying= => false)
      expect(subject.land_plane(airplane)).to eq "Plane successfully landed!"
    end

    it "return error if landing planes already on land" do 
      airplane = double(:flying => false)
      expect { subject.land_plane(airplane) }.to raise_error "This plane is on the ground!"
    end

    it "prevents airplane from landing if airport is full" do
      subject.capacity.times { 
        airplane = double(:flying => true, :flying= => false)
        subject.land_plane(airplane) 
      }

      airplane = double(:flying => true, :flying= => false)
      expect { subject.land_plane(airplane) }.to raise_error "Sorry, airport is full!"
    end
  end

  describe "take_off" do
    it "instructs airplane to take off" do
      airplane = double(:flying => true, :flying= => false)
      subject.land_plane(airplane) 
      airplane = double(:flying => false, :flying= => true)
      expect(subject.take_off(airplane)).to eq "Plane successfully took off!"
    end

    it "returns error if asks flying planes to take_off" do
      airplane = double(:flying => true)
      expect { subject.take_off(airplane) }.to raise_error "This plane is already flying!"
    end

    it "lets user know airport is empty if there are no planes to takeoff" do
      airplane = double(:flying => false)
      expect { subject.take_off(airplane) }.to raise_error "There are no airplanes to take off!"
    end
  end

  it "Changes airport capacity from standard (5)" do
    expect(subject.capacity = 8).to eq 8
  end
end
