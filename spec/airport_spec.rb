require 'airport'

describe Airport do

	subject(:airport) {described_class.new}  # subject = new class of described class, which is Airport

	it 'instructs a plane to land' do
		expect(subject).to respond_to(:land).with(1).argument  #unsure how these 3 lines are shorter than a 1 liner: it {is_expected.to respond_to(:land).with(1).argument}
	end

end
	


