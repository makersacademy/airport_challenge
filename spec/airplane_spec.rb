require 'airplane'

describe Airplane do

  it "Is expected to return the flight status of the Airplane." do
    expect(subject).to respond_to(:flight_status?)
  end

end
