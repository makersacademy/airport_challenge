require 'airport'
require 'weather'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument } 

  it 'adds plane to hanger when landed' do
    subject.land("plane")
    expect(subject.hanger[0]).to eq "plane"
  end

  it { is_expected.to respond_to(:take_off) }

  it 'removes plane from airport on take off' do
    subject.land("plane")
    subject.take_off("plane")
    expect(subject.hanger).not_to include "plane"
  end

  it 'Airport takes 1 argument' do 
    expect(Airport).to respond_to(:new).with(1).argument
  end

  it 'Airport initializes default capacity of 20' do
    expect(subject.capacity).to eq 20
  end
  
  it 'full? raises error' do
    20.times { subject.land("plane") }
    expect { subject.land("plane") }.to raise_error 'Airport Full!'
  end

end
