require "rspec/expectations"
require 'airport'

describe Airport do 
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather)}

  before(:each) do  
    allow(plane).to receive(:landed)
    allow(plane).to receive(:flying)
  end
  
  it{is_expected.to respond_to(:planes)}

  describe 'capacity' do 
    it 'should have a initial capacity' do
      allow(weather).to receive(:storm?).and_return(false)
      described_class::DEFAULT_CAPACITY.times {subject.arrive(plane, weather)}
      expect{subject.arrive(plane, weather)}.to raise_error "airport is full"
    end
  end    

  describe 'arrival' do
    it {is_expected.to respond_to(:arrive).with(2).argument}
    
    it 'should receive a landing plane' do
    allow(weather).to receive(:storm?).and_return(false)
    subject.arrive(plane, weather)
    expect(subject.planes).to include(plane)
    end

    it 'when there is a storm planes cant arrive' do
      allow(weather).to receive(:storm?).and_return(true)
      expect{subject.arrive(plane)}.to raise_error
    end
  end

  describe 'departure' do
    it {is_expected.to respond_to(:depart).with(2).argument}
  
    it 'should let a plane depart' do
    allow(weather).to receive(:storm?).and_return(false)
      subject.arrive(plane, weather)  
      subject.depart(plane, weather)
      expect(subject.planes).not_to include(plane)
    end

    it 'when there is a storm planes cant depart' do
    allow(weather).to receive(:storm?).and_return(true)
    expect{subject.depart(plane)}.to raise_error
    end

  end
end
