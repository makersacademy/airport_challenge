require 'airplane'
require 'airport'
require 'weather'

describe Airplane do
  it "doesn't raise error when creating airplane" do
    expect { Airplane.new }.not_to raise_error
  end

  it { is_expected.to respond_to :flying }
  
  it "switches flying to false when plane lands" do
    airport = double(:Airport)
    allow(airport).to receive(:land)
    airport.land(subject)
    expect(subject.flying).to eq false
  end

end
