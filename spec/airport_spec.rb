require 'airport'

describe Airport do
  let (:plane) {double :plane, land: true, take_off: false}
  let (:WeatherStation_stormy) {double :WeatherStation, stormy?: true}
  
  describe "#land" do
  	it "lands a plane" do
  		expect(subject.allow_landing(plane).last).to eq plane
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
