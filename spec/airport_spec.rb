require "airport"


describe Airport do

  let(:weather) { double :weather, :stormy= => false, stormy: false}
  let(:plane) { double :plane }
  it { is_expected.to respond_to :landed}

  it 'confirms a plane has landed' do
    allow(weather).to receive(:stormy).and_return(false)
    #plane = Plane.new
    subject.stormy = false
    subject.landed(plane)
    #weather = Weather.new.stormy
    expect(subject.stormy).to eq false
  end


  it { is_expected.to respond_to :departure}

  it 'plane departs from airport' do
  allow(weather).to receive(:stormy).and_return(false)
  #subject.landed(plane)
  subject.stormy = false
  #weather = Weather.new.stormy
  subject.departure
  expect(subject.stormy).to eq false

  end

  it { is_expected.to respond_to :stormy}

  #it 'prevents planes from departing if stormy' do
  #expect {subject.stormy}.to raise_error 'Unable to depart due to stormy weather'
  #end

end
