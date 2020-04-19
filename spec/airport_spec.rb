require 'airport'

describe Airport do

  before do
    allow(subject).to receive(:storm?).and_return false
  end

  it "Instructs a plane to land at the airport." do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "Instructs a plane to take_off." do
    expect(subject).to respond_to(:take_off)
  end

  it 'Prevents a plane from landing when the airport is full.' do
    subject.capacity.times { subject.land Airplane.new }
    expect { subject.land Airplane.new }.to raise_error 'AIRPORT FULL - permission to land denied.'
  end

  it 'Prevents a plane from taking off when there is a storm.' do
    allow(subject).to receive(:storm?).and_return true
    expect { subject.take_off }.to raise_error 'Storm in progress - all flights are grounded.'
  end

  it 'Prevents a plane from ;anding when there is a storm.' do
    allow(subject).to receive(:storm?).and_return true
    expect { subject.land Airplane.new }.to raise_error 'Storm in progress - permission to land denied.'
  end

end
