
require 'spec_helper'
require './lib/plane'

describe Plane do 

subject { described_class.new }

	it 'If I want a plane to land' do
		expect(subject).to be_flying
	end

	it 'Once landed it does not have a flying status' do
		subject.land?
		expect(subject).not_to be_flying
	end
end