require 'plane'

describe Plane do
	
	context "On initialise" do
		it 'the plane starts flying' do
		    expect(subject.is_flying?).to eq true
		end
	end

	it 'has_landed changes flying to false' do
		subject.has_landed
	    expect(subject.is_flying?).to eq false
	end

	it 'has_taken off changes flying to false' do
		subject.has_landed
		subject.has_taken_off
	    expect(subject.is_flying?).to eq true
	end

	it 'is_flying? shows the planes status' do
	    expect(subject.is_flying?).to eq true
	end
end



