
require 'spec_helper'
require './lib/plane'

describe Plane do 

subject { described_class.new }

	it 'If I want a plane to land it must have a flying status' do
		expect(subject).to be_flying
	end

	it 'Once landed it does not have a flying status' do
		subject.land?
		expect(subject).not_to be_flying
	end

	it 'Once taken off it has a flying status' do
    subject.flying?
    expect(subject).to be_flying
	end
end