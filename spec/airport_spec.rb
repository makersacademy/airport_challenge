require 'airport.rb'

describe Airport do
  it "land a plane" do
    expect(subject).to respond_to(:land).with(1).argument
  end
