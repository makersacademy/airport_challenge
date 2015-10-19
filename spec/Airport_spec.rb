require "./lib/Airport.rb"


describe Airport do

  let(:plane){ double :plane, land: true, landed: false }
	let(:plane1){double :plane, flying: true, landed: true }

	it { is_expected.to respond_to(:land).with(1).argument }

	it { is_expected.to respond_to(:take_off) }

	it "return can not land, airport is full!" do
		allow(subject.weather).to receive(:stormy?).and_return false
		subject.capacity.times { subject.land(plane) }
		expect { subject.land(plane) }.to raise_error "Can not land, airport is full!"
	end

	it "return Can not take off, weather is too bad" do
		allow(subject.weather).to receive(:stormy?).and_return true
		expect { subject.take_off(plane1) }.to raise_error "Can not take off, weather is too bad."
	end

	it "return Can not land, weather is too bad" do
		allow(subject.weather).to receive(:stormy?).and_return true
		expect { subject.land(plane1) }.to raise_error "Can not land, weather is too bad."
	end

	it "will only allow planes to take off from the airport that they are at" do
		allow(subject.weather).to receive(:stormy?).and_return false
		expect { subject.take_off(plane1) }.to raise_error "Can not take off, plane is not at this airport."
	end

	it "can set own airport capacity" do
		allow(subject.weather).to receive(:stormy?).and_return false
		airport = Airport.new(30)
		subject.capacity.times { subject.land(plane) }
		expect { subject.land(plane) }.to raise_error "Can not land, airport is full!"
	end

	it "plane can not land if already landed" do
    allow(subject.weather).to receive(:stormy?).and_return false
    expect { subject.land(plane1) }.to raise_error "Can not land, plane has already landed!"
    end

  it "plane can land and then take off" do
    allow(subject.weather).to receive(:stormy?).and_return false
		allow(plane).to receive(:flying)
		subject.land(plane)
		subject.take_off(plane)
		expect(plane.landed).to eq false
  end
end
