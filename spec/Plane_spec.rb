require 'plane'

describe Plane do
	it 'responds to method flying?' do
		expect(subject).to respond_to (:flying?)
	end

	it 'is working' do
	expect(subject).to be_flying
end
end


