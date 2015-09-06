require 'plane'

describe Plane do
	
		it { is_expected.to respond_to(:land)}
		it { is_expected.to respond_to(:take_off)}
		it { is_expected.to respond_to(:flying?)}

		it "plane lands at airport and stops flying" do 
			subject.land
			expect(subject.flying?).to eql(false)
	   	end

	    it "plane takes off from airport and starts flying" do 
			subject.land
			subject.take_off
			expect(subject.flying?).to eql(true)
	    end

	end

	describe '#new' do

		it 'Plane should be flying' do 
			expect(Plane).to respond_to(:new)
		end 

	end 


