require "plane" 

describe Plane do 
	it "can check if plane has taken off" do 
		expect(subject).respond_to? :plane_take_off 
	end

	it 'Can confirm plane has taken off' do
		subject.confirm_take_off
		expect(subject).to be_taken_off
	end

end