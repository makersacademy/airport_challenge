require "airport"
require "plane"
require "weather"

describe Airport do


	
	subject(:airport) { described_class.new }
	let (:plane) {double(:plane)}
	let (:weather) {double(:weather, random_outlook: :stormy?)}
		

		#landing
		it "Plane can land" do
			allow(subject.weather).to receive(:stormy?) {false}
			subject.land(plane)
		end

		it "Confirm plane landed" do
			allow(subject.weather).to receive(:stormy?) {false}
			subject.land(plane)
			expect(subject.landed?(plane)).to eq true
		end

		it "The plane can not land due storm" do
			allow(subject.weather).to receive(:stormy?) {true}
			expect {subject.land(plane)}
		end

		#departing

		it "Plane can depart" do
			allow(subject.weather).to receive(:stormy?) {false}
			expect {subject.depart(plane)}
		end

		it "Confirm plane departed" do
			allow(subject.weather).to receive(:stormy?) {false}
			expect(subject.departed?(plane)).to eq true
		end

		it "The plane can not depart due storm" do
			allow(subject.weather).to receive(:stormy?) {true}
			expect {subject.depart(plane).to raise_error "Unable to take off due to stormy weather"}
		end

		#airport capacity

		it "airport with a default capacity of 20 planes" do
			allow(subject.weather).to receive(:stormy?) {false}
			allow(subject).to receive (:landed?) {false}
			20.times {subject.land(plane)}
			expect{subject.land(plane)}.to raise_error "Unable to land due airport in full capacity"
		end

		it "no plane in airport, no departing" do
			allow(subject.planes_in_airport).to receive(:landed?) {false}
			expect{subject.depart(plane)}.to raise_error "Plane not in the airport"
		end
end