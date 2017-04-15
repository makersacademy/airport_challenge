require 'Plane'
 #
describe Plane do 
	subject {Plane}
	it 'Should return instance of plane when initialized' do
		expect(subject).to respond_to(:new)
	end


end
