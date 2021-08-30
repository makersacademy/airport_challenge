require 'airport'

describe Airport do

  context 'So I can get passengers to a destination' do 
    it 'Checks if the airport can land planes' do
      allow(subject).to receive(:weather_forecast).and_return('Sunny')
      expect(subject).to respond_to(:landing)
    end
  end

  it "Confirm if a plane is ready for take off" do
    allow(subject).to receive(:weather_forecast).and_return('Sunny')
    expect {subject.take_off}.to raise_error "No flights avialible"
  end

  context 'To ensure saftey' do 
    it 'I want to prevent landing when the airport is full' do
      allow(subject).to receive(:weather_forecast).and_return('Sunny')
      subject.capacity.times { subject.landing double :plane }
      expect { subject.landing double :plane }.to raise_error 'Airport is full'
    end
  end

  context 'So that the software can be used for many different airports' do
    it 'Creates a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  context 'Creates a new capacity' do
    new_capacity = 20
    subject { Airport.new(new_capacity) }
    it 'Checks new capacity' do
      expect(subject.capacity).to eq new_capacity
    end
  end
  
end