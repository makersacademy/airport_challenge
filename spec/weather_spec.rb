require 'weather'

describe Weather do
	alias weather subject

	it { is_expected.to respond_to(:make_it_rain)}

	 it '#make_it_rain' do
	 	subject.make_it_rain
	 	expect(weather).to be_stormy
	 end
	
end