
require 'airport'

describe Airport do

	subject(:airport){ described_class.new }     
																						
	it {is_expected.to respond_to :land}

	it 'confirmation plane landed' do
		expect(subject.land Plane.new).to eq "Plane has landed"
	end

end