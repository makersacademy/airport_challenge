require 'spec_helper'

describe Airport do
  subject(:airport) { described_class.new }

  it 'should instruct a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'should instruct a plane to take_off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
end
