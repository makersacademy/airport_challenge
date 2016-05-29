require 'plane'

describe Plane do

	let(:airport) {double(:airport, accept_plane?: true, 
    airport?: true, 
    release_plane: true, 
    receive_plane: true)}
  let(:bad_weather) {double(:weather, stormy?: true)}
  let(:good_weather) {double(:weather, stormy?: false)}

	describe "#land(airport)" do
		it "should take the land message with 1 argument" do
			expect(subject).to respond_to(:land).with(1).argument
		end
		it "shouldn't land if the weather is stormy" do
			subject.new_weather(bad_weather)
			expect{subject.land(airport)}.to raise_error
		end
		it "should send a land message to its airport that it has landed" do
      subject.new_weather(good_weather)
			expect(airport).to receive(:accept_plane?)
			subject.land(airport)
		end
		it "shouldn't land if already landed" do
      subject.new_weather(good_weather)
			subject.land(airport)
			expect{subject.land(airport)}.to raise_error
		end
	end

	describe "#landed?" do
		it "should be landed at an airport" do
      subject.new_weather(good_weather)
			subject.land(airport)
			expect(subject).to be_landed
		end
	end

	describe "#take_off" do
		it "should take the take_off message" do
			expect(subject).to respond_to(:land)
		end
		it "should not be landed at an airport" do
      subject.new_weather(good_weather)
			subject.land(airport)
			subject.take_off
			expect(subject).to_not be_landed
		end
		it "shouldn't take off if the weather is stormy" do
			subject.new_weather(bad_weather)
			expect{subject.take_off}.to raise_error
		end
		it "shouldn't take off if already in the air" do
      subject.new_weather(good_weather)
			subject.land(airport)
			subject.take_off
			expect{subject.take_off}.to raise_error
		end
	end

	describe "#position" do
		it "should take the position message" do
			expect(subject).to respond_to(:position)
		end
		it "should return its airport" do
      subject.new_weather(good_weather)
			subject.land(airport)
			expect(subject.position).to eq(airport)
		end
	end

	describe "#new_weather" do
		it "should take the new_weather message" do
			expect(subject).to respond_to(:new_weather).with(1)
		end
	end

end