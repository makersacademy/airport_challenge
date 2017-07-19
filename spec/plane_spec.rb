require 'Plane'

describe Plane do 
	describe :new do
		subject {Plane}
		it 'Should return instance of plane when initialized' do
			expect(subject).to respond_to(:new)
		end
		it "Should keep track of how many planes have been created" do
			subject.class_variable_set(:@@planes, 0)
			subject.new
			expect(subject.class_variable_get(:@@planes)).to eq 1
			subject.new
			expect(subject.class_variable_get(:@@planes)).to eq 2
		end
	end
end
