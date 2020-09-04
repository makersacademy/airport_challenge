require 'airport'

describe Airport do

   it {is_expected.to respond_to :takeoff}

   it {is_expected.to respond_to :land}

   it {is_expected.to respond_to :airplanes}

   it "Checks if airport is empty" do
    expect(subject.airplanes).to eq []
   end
   describe ""
   it "Lands a plane" do
    allow(Planes).to receive(:land).and_return(false)
    expect(subject.land(Planes)).to include(Planes)
   end
   it "raises an error if the airport is full" do
    Airport::DEFAULT_CAPACITY.times do
        subject.land Planes.new
    end
        expect {subject.land Planes.new}.to raise_error "You can't land, we're full!"
    end
end