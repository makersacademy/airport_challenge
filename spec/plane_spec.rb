require 'plane'
describe Plane do
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  it "is at the airport once landed" do
    airport = double(:airport, full?: false, stormy?: false, planes: [])
    subject.land(airport)
    expect(airport.planes).to include subject
  end
  it "is not at the airport once took off" do
    airport = double(:airport, full?: false, stormy?: false, planes: [])
    subject.land(airport)
    subject.take_off(airport)
    expect(airport.planes).not_to include subject
  end
  it "confirms plane at the airport" do
    airport = double(:airport, full?: false, stormy?: false, planes: [])
    subject.land(airport)
    expect(subject.status(airport)).to eq true
  end
  it "confirms plane alredy took off" do
    airport = double(:airport, full?: false, stormy?: false, planes: [])
    subject.land(airport)
    subject.take_off(airport)
    expect(subject.status(airport)).to eq false
  end
  it 'raise an error when weather is stormy for land' do
    airport = double(:airport, full?: false, stormy?: true, planes: [])
    expect { subject.land(airport) }.to raise_error "It is stormy"
  end
  it 'raise an error when weather is stormy for take_off' do
    airport = double(:airport, full?: false, stormy?: true, planes: [subject])
    expect { subject.take_off(airport) }.to raise_error "It is stormy"
  end
  it 'raise an error when airport is full' do
    airport = double(:airport, full?: true, stormy?: false, planes: [])
    expect { subject.land(airport) }.to raise_error "airport full"
  end
  it 'cannot land twice' do
    airport = double(:airport, full?: false, stormy?: false, planes: [subject])
    expect { subject.land(airport) }.to raise_error "already landed"
  end
  it 'cannot take off while not at the airport' do
    airport = double(:airport, full?: false, stormy?: false, planes: [])
    message = "No such a plane at this airport"
    expect { subject.take_off(airport) }.to raise_error message
  end
end
