require "airport"


describe Airport do

  let(:weather) { double :weather, :sunshine= => true, sunshine: true}
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:landed).with(1).argument }

  it 'Confirms a plane has landed' do
    allow(weather).to receive(:sunshine).and_return(true)
    subject.landed(plane)
    expect(subject.sunny).to eq true
  end


  it { is_expected.to respond_to :departure}

  it 'Plane departs from airport' do
  allow(weather).to receive(:sunshine).and_return(true)
  subject.departure
  expect(subject.sunny).to eq true

  end

  it { is_expected.to respond_to :full?}

  it "Gives an error when airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.landed(plane) }
    expect{subject.landed(plane)}.to raise_error 'Airport full'
  end

    it 'Allow user to set capacity of airport' do
      # Create a custom airport capacity using the DEFAULT_CAPACITY constant
      num = 50
      airport = Airport.new(num)
      expect(airport.capacity).to eq num

      # Create a default airport capacity using the DEFAULT_CAPACITY constant
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
   end


  # it 'prevents planes from departing if stormy' do
  #   expect {subject.sunny}.to raise_error 'Unable to depart due to stormy weather'
  # end

end
