require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:clear) { double :weather }
  let(:stormy) { double :weather }

  it 'responds to land(plane)' do
    expect(subject).to respond_to :land
  end

  it 'the landed plane goes into the hanger array' do
    allow(clear).to receive(:forecast).and_return("It's clear!")
    subject.land(plane, clear.forecast)
    expect(subject.hanger).to include(plane)
  end

  it 'can instruct a plane to take off' do
    expect(subject).to respond_to :take_off
  end

  it 'take_off causes a plane to leave the hanger' do
    allow(clear).to receive(:forecast).and_return("It's clear!")
    subject.land(plane, clear.forecast)
    expect(subject.take_off(clear.forecast)).to eq plane
  end

  it 'raises an error if the hanger is empty' do
    allow(clear).to receive(:forecast).and_return("It's clear!")
    expect { subject.take_off(clear.forecast) }.to raise_error('There are no planes in the hanger!')
  end

  it 'prevents landing when the airport is full' do
    allow(clear).to receive(:forecast).and_return("It's clear!")
    subject.capacity.times { subject.land(plane, clear.forecast) }
    expect { subject.land(plane, clear.forecast) }.to raise_error('The airport is full!')
  end

  it 'the capacity of the hanger can change when appropriate' do
    a = Airport.new(5)
    b = Airport.new
    expect(a.capacity).not_to eq(b.capacity)
  end

  it 'if its stormy the plane wont take off' do
    allow(clear).to receive(:forecast).and_return("It's clear!")
    allow(stormy).to receive(:forecast).and_return("It's stormy!")
    subject.land(plane, clear.forecast)
    expect { subject.take_off(stormy.forecast) }.to raise_error("The conditions aren't good enough!")
  end

  it "if it's stormy planes wont land" do
    allow(stormy).to receive(:forecast).and_return("It's stormy!")
    expect { subject.land(plane, stormy.forecast) }.to raise_error("The conditions aren't good enough!")
  end
end
