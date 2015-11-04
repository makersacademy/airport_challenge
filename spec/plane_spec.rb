require 'plane'

describe Plane do

  it {is_expected.to(respond_to(:take_off))}

  it {is_expected.to(respond_to(:land))}

  it 'checks that the plane is flying when initialized' do
    expect(subject.flying?).to eq(true)
  end

  it 'checks if plane is not flying when it is landed' do
    subject.land
    expect(subject.flying?).to eq(false)
  end

  it 'checks if plane is flying when it takes off' do
    subject.take_off
    expect(subject.flying?).to eq(true)
  end
end
