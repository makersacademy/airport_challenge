require 'airplane'
require 'airport'
require 'weather'

describe Airplane do
  it "doesn't raise error when creating airplane" do
    expect { Airplane.new }.not_to raise_error
  end

  it 'is able to take off from airport' do
    expect {subject.take_off}.not_to raise_error
  end

  # it "expects that when plane takes off, it is no longer at airport" do
  #   Heathrow = Airport.new
  #   Heathrow.land(subject)
  #   subject.take_off
  #   expect(Heathrow.planes).to be_empty
  # end
  
end
