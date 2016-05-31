require 'airport'

describe Airport do
  let (:plane) {double :plane, land: true, take_off: false, flying?: true}
  
  it "has a default hangar capacity of 5" do
  	expect(subject.capacity).to eq 5
  end

  it "takes and argument at initialization, and uses it to set the capacity" do
  	expect(Airport.new(10).capacity).to eq 10
  	expect(Airport.new(20).capacity).to eq 20
  end
  
  describe "#land" do
  	it "lands a plane if the weather is good" do
  		allow(subject).to receive(:stormy?).and_return(false)
  		expect(subject.allow_landing(plane).last).to eq plane
  	end

  	it "doesn't land a plane if the hangar is full" do
      allow(subject).to receive(:stormy?).and_return(false)
      5.times {subject.allow_landing(plane)}
      expect{subject.allow_landing(plane)}.to raise_error "The hangar is full, landing denied!"
  	end

  	it "raises an error if the wather is stormy" do
  		allow(subject).to receive(:stormy?).and_return(true)
  		expect{subject.allow_landing(plane)}.to raise_error "It is too dangerous to land due to weather conditions!"
    end

  end

  describe "#allow_take_off" do
  	it "allows a plane to take off if the weather is good" do
  		allow(subject).to receive(:stormy?).and_return(false)
  		subject.allow_landing(plane)
  		expect(subject.allow_take_off).to eq plane
  	end

  	it "raises an error if there are no planes in the hangar" do
  		expect{subject.allow_take_off}.to raise_error("The hangar is empty!!")
  	end

  	it "raises an error if the wather is stormy" do
  		allow(subject).to receive(:stormy?).and_return(false)
  		subject.allow_landing(plane)
  		allow(subject).to receive(:stormy?).and_return(true)
  		expect{subject.allow_take_off}.to raise_error "It is too dangerous to take off due to weather conditions!"
  	end

  end

end
