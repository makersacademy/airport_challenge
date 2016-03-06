require "rspec/expectations"
require 'airport'

describe Airport do 
  let(:plane) {double(:plane, status: nil , flying: nil, landed: nil)}
  let(:weather) {double(:weather)}


  it{is_expected.to respond_to(:planes)}

  describe 'capacity' do 
    it 'should have a initial capacity' do
      allow(weather).to receive(:storm?).and_return(false)
      described_class::DEFAULT_CAPACITY.times {subject.arrive(plane, weather)}
      expect{subject.arrive(plane, weather)}.to raise_error "airport is full"
    end
  end    

  describe 'arrival' do
    
    it 'should initiate a plane to land' do
    allow(weather).to receive(:storm?).and_return(false)
    subject.arrive(plane, weather)
    end

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
