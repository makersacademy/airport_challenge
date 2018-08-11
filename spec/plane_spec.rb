require 'plane'

describe Plane do
  it 'initializes with flight_no set to nil by default' do
    expect(subject.flight_no).to eq nil
  end

  it 'flight_no can be set as required' do
    subject.instance_variable_set(:@flight_no, 123)
    expect(subject.flight_no).to eq 123
  end 
end