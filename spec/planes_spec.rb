require './lib/planes.rb'

describe Planes do
  it 'Test plane is landed at initialization' do
    expect(subject.plane_landed).to eq true
  end

  it 'Test plane takes off' do
    subject.take_off
    expect(subject.plane_landed).to eq false
  end

  it 'Test plane lands' do
    subject.take_off
    subject.land

    expect(subject.plane_landed).to eq true
  end
end
