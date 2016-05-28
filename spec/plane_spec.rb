require 'plane'

describe Plane do

	let(:airport) {double(:airport, accept_plane?: true, is_airport?: true)}
	let(:weather) {double(:weather, stormy?: true)}

	describe "#land(airport)" do
		
		it "should take the land message with 1 argument" do
			expect(subject).to respond_to(:land).with(1).argument
		end
		it "shouldn't land if the weather is stormy" do
			subject.weather(weather)
			expect{subject.land(airport)}.to raise_error
		end
		it "should send a land message to its airport that it has landed" do
			expect(airport).to receive(:accept_plane?)
			subject.land(airport)
		end
		it "shouldn't land if already landed" do
			subject.land(airport)
			expect{subject.land(airport)}.to raise_error
		end
	end

	describe "#landed?" do
		it "should be landed at an airport" do
			subject.land(airport)
			expect(subject).to be_landed
		end
	end

	describe "#take_off" do
		it "should take the take_off message" do
			expect(subject).to respond_to(:land)
		end
		it "should not be landed at an airport" do
			subject.land(airport)
			subject.take_off
			expect(subject).to_not be_landed
		end
		it "shouldn't take off if the weather is stormy" do
			subject.weather(weather)
			expect{subject.take_off}.to raise_error
		end
		it "shouldn't take off if already in the air" do
			subject.land(airport)
			subject.take_off
			expect{subject.take_off}.to raise_error
		end

	end

	describe "#get_airport" do
		it "should take the get_airport message" do
			expect(subject).to respond_to(:get_airport)
		end
		it "should return it's airport" do
			subject.land(airport)
			expect(subject.get_airport).to eq(airport)
		end
	end



end