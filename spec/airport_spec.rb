require 'airport'

describe Airport do
  it {is_expected.to respond_to(:land_plane).with(1).argument}
  it {is_expected.to respond_to(:take_off).with(1).argument}
  it {is_expected.to respond_to(:planes_in_hangar)}
  it {is_expected.to respond_to(:plane_status).with(1).argument}




  let(:plane) {double :plane}
  it 'should land a plane' do
    allow(plane).to receive_messages(landed: false)
    subject.land_plane(plane)
    expect(subject.hangar).not_to be_empty
  end



  it 'should takeoff a plane' do
    allow(plane).to receive_messages(takeoff: true)
    subject.take_off(plane)
    expect(subject.hangar).to be_empty
  end

  let(:weather) {double :weather}
  it 'verifies the state of the weather' do
    allow(weather).to receive_messages(current: "good weather")
    subject.current_weather(weather)
    expect(subject.clear).to be_a String
  end

  it 'prevents takeoff in bad weather' do
    subject.clear = "bad weather"
    subject.take_off(plane)
    expect(subject.take_off(plane)).to eq "cant take off"
  end

  it 'prevents landing in bad weather' do
    subject.clear = "bad weather"
    subject.land_plane(plane)
    expect(subject.land_plane(plane)).to eq "can't land"
  end

  it 'prevents landing if the airport is full' do
    subject.full = "hangar is full"
    subject.land_plane(plane)
    expect(subject.hangar).to be_empty
  end


  it 'should report on the status of the plane' do
    allow(plane).to receive_messages(flying?: true)
    expect(subject.plane_status(plane)).to be_truthy
  end

  it 'should have a modifiable default capacity' do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end
end
