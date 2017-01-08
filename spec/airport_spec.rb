require "airport"


describe Airport do

  let(:weather) { double :weather, :sunshine= => true, sunshine: true}
  let(:plane) { double :plane }

  it { is_expected.to respond_to(:landed).with(1).argument }

  it 'confirms a plane has landed' do
    allow(weather).to receive(:sunshine).and_return(true)
    #plane = Plane.new
    subject.sunny = true
    subject.landed(plane)
    #weather = Weather.new.stormy
    expect(subject.sunny).to eq true
  end


  it { is_expected.to respond_to :departure}

  it 'plane departs from airport' do
  allow(weather).to receive(:sunshine).and_return(true)
  #subject.landed(plane)
  subject.sunny = true
  #weather = Weather.new.stormy
  subject.departure
  expect(subject.sunny).to eq true

  end

  it { is_expected.to respond_to :full?}


  it "gives an error when airport is full" do
    Airport::DEFAULT_CAPACITY.times { subject.landed(plane) }
    expect{subject.landed(plane)}.to raise_error 'Airport full'
  end
  
  #it 'prevents planes from departing if stormy' do
  #expect {subject.stormy}.to raise_error 'Unable to depart due to stormy weather'
  #end

end
