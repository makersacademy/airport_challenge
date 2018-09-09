require 'airplane'
require 'airport'
require 'weather'

describe Airplane do
  it "doesn't raise error when creating airplane" do
    expect { Airplane.new }.not_to raise_error
  end

  it { is_expected.to respond_to :flying_status }
  
  it "switches flying to false when plane lands" do
    airport = double(:Airport, land: subject.landed)
    airport.land(subject)
    expect(subject.flying_status).to eq false
  end

  it "switching flying to true when plane takes off" do
    airport = double(:Airport, take_off: subject.landed)
    airport.take_off(subject)
  end

end
