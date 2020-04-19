require 'airport'

describe Airport do

  it "Instructs a plane to land at the Airport." do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "Instructs a plane to take_off." do
    expect(subject).to respond_to(:take_off)
  end

  it 'Prevents a plane from Landing when the airport is full.' do
    20.times { subject.land Airplane.new }
    expect { subject.land Airplane.new }.to raise_error 'AIRPORT FULL - permission to land denied.'
  end

end
