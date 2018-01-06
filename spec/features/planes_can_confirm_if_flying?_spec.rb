require 'airport'

describe 'Plane can confirm its own flying status' do
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }
  let(:airport) { Airport.new(weather) }

  it 'confirms plane is flying at initialisation' do
    expect(plane.flying?).to eq true
  end
  it 'confirms plane is not flying if landing method called' do
    plane.landed
    expect(plane.flying?).to eq false
  end
  it 'will raise an error if non flying plane is landed again' do
    plane.landed
    expect { plane.landed }.to raise_error "Plane is already grounded"
  end
  it 'will raise an error if flying plane is taken off again' do
    expect { plane.taken_off }.to raise_error "Plane is already in the air"
  end
end
