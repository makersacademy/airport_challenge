require 'airport'

describe Airport do
    
    describe '#initialize' do
    end
    
    it 'has default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
        
    describe '#land()' do

    it 'should know when a plane has landed' do
    trial_plane = Plane.new
    subject.land(trial_plane)
    expect(subject.land(trial_plane).pop).to eq trial_plane
    end
    
    it 'should return an error if the airport is full' do
    trial_plane = Plane.new
    allow(subject).to receive(:storm_weather?).and_return(false)
    15.times {subject.land(trial_plane)}
    expect{ subject.land(trial_plane) }.to raise_error 'The airport is currently full.'
    end
    
    it 'raises an error if the plane tries to land during a storm' do
    trial_plane = Plane.new
    allow(subject).to receive(:storm_weather?).and_return(true)
    expect{ subject.land(trial_plane) }.to raise_error 'Plane is unable to land due to adverse weather conditions.'
    end
    end
    
    describe '#depart()' do
    
    it 'should know when a plane has departed' do
    trial_plane = Plane.new
    subject.land(trial_plane)
    subject.depart(trial_plane)
    expect(subject.flight_checker(trial_plane)).to eq false
    end
    end
end