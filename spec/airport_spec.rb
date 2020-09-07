require 'airport'

describe Airport do

  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :airplanes }
  it "Checks if airport is empty" do
    expect(subject.airplanes).to eq []
  end
  it "Checks that DEFAULT_CAPACITY can be overridden." do
    heathrow = Airport.new(1000)
    expect(heathrow.capacity).to eq 1000
  end
    
  context "good weather tests" do
    before do
    allow(subject).to receive(:bad_weather).and_return(false)
    end   
        
    it "Checks that you can land a plane and @airplanes increases by 1" do
      expect { subject.land }.to change { subject.airplanes.length }.by 1 
    end
   
    it "raises an error when trying to land if the airport is full" do     
      Airport::DEFAULT_CAPACITY.times do
      subject.land
      end
      expect { subject.land }.to raise_error "You can't land, we're full!"
    end
    it "lands a plane when the weather is good" do
      subject.land
    end
end
            
  context "Bad weather tests" do
    before do
      allow(subject).to receive(:bad_weather).and_return(true)
    end
    it "Checks that planes won't land when the weather is bad" do
      expect { subject.land }.to raise_error "Crap weather! Don't land!"
    end

    it "Checks that planes won't takeoff when the weather is bad" do
      allow(subject).to receive(:bad_weather).and_return(false)
      subject.land
      allow(subject).to receive(:bad_weather).and_return(true)
      expect { subject.takeoff }.to raise_error "Crap weather! Don't take off!"
    end
  end
end
