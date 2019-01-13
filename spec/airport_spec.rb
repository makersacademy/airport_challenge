require 'airport'

RSpec.describe Airport do
  it 'instructs a plane to land' do
    is_expected.to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    is_expected.to respond_to(:take_off).with(1).argument
  end
  
  it 'instructs to see planes' do
    is_expected.to respond_to(:plane)
  end

  it 'check plane landed after instructed to' do
    plane = double :plane
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  it 'check plane took off after instructed to' do
    plane = double :plane
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.plane).to_not eq plane
  end

  
end
