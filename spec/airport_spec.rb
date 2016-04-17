require 'airport'
require 'rspec/expectations'

describe Airport do
	it {is_expected.to respond_to(:land)}
	it {is_expected.to respond_to(:take_off)}
end


