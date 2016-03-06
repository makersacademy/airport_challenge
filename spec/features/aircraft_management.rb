require 'airport'
require "spec_helper"

RSpec.feature 'Takes off and lands planes' do
  let(:plane) { double(:plane, land:nil, take_off:nil) }
  before :each do
    allow(subject).to receive(:forecast) { 'sunny' }
  end

  scenario 'The weather is stormy' do
    allow(subject).to receive(:forecast) { 'stormy' }
    expect { subject.land(plane) }.to raise_error 'haha'
  end
end
