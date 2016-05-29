require 'Airport'

describe Airport do
	
	let(:plane) { double(:plane) }
	let(:weather) { double(:weather) }

	describe '#capacity' do

		it 'the default capacity should be 10' do
			expect(subject.capacity).to eq 10
		end

	end

	describe '#land' do

		it 'expects an argument of (plane) so it knows which to land' do
			expect{(subject.land).with(no_args) }.to raise_error ArgumentError 
		end

		it 'instructs the plane to land' do
			allow(plane).to receive(:status)
			allow(plane).to receive(:set_landed)
			allow_any_instance_of(Weather).to receive(:status).and_return("sunny")
			expect(subject.land(plane)).to eq "landed plane: #{plane}"
		end

		it 'should return an error if the plane is not airborne' do

			allow(plane).to receive(:status).and_return("landed")
			expect{subject.land(plane)}.to raise_error RuntimeError
		end

		it 'cannot land if airport full' do
			allow(plane).to receive(:status)
			allow(plane).to receive(:set_landed)
			allow_any_instance_of(Weather).to receive(:status).and_return("sunny")
			10.times { subject.land(plane) }
			expect{subject.land(plane)}.to raise_error RuntimeError
		end

		it 'cannot land if weather stormy' do
			allow(plane).to receive(:status)
			allow(plane).to receive(:set_landed)	
			allow_any_instance_of(Weather).to receive(:status).and_return("stormy")
			expect{subject.land(plane)}.to raise_error RuntimeError
		end

	end

	describe '#takeoff' do

		it 'expects an argument of (plane) so it knows which to release' do
			expect { subject.takeoff.with(no_args) }.to raise_error ArgumentError 
		end

		it 'instructs a plane to takeoff' do
			allow_any_instance_of(Weather).to receive(:status).and_return("sunny")
			allow(plane).to receive(:set_airborne)
			allow(plane).to receive(:status)
			allow(plane).to receive(:set_landed)
			subject.land(plane)
			expect(subject.takeoff(plane)).to eq "plane taken off"
		end

		it 'cannot takeoff if weather stormy' do
			allow(plane).to receive(:status)
			allow(plane).to receive(:set_landed)	
			allow_any_instance_of(Weather).to receive(:status).and_return("stormy")
			expect{subject.takeoff(plane)}.to raise_error RuntimeError
		end

		it 'cannot takeoff if the plane is not at that airport (e.g. airborne)' do
			allow(plane).to receive(:status) 
			expect{subject.takeoff(plane)}.to raise_error RuntimeError
		end

	end

	describe '#check_weather' do

		it 'should return "sunny" if weather is sunny' do
			allow_any_instance_of(Weather).to receive(:status).and_return("sunny")
			expect(subject.check_weather).to eq "sunny"
		end

		it 'should return "stormy" if weather is stormy' do
			allow_any_instance_of(Weather).to receive(:status).and_return("stormy")
			expect(subject.check_weather).to eq "stormy"
		end
		
	end

end