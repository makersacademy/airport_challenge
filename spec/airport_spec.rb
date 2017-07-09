require 'airport'

describe Airport do
  context 'confirms planes status' do
    it { is_expected.to respond_to :landed? }

    it 'confirms plane has landed' do
      plane = subject.landed?
      expect(plane.land).to be_truthy
    end
  end
  it { is_expected.to respond_to :takeoff? }

  it 'confirms plane has takeoff' do
    plane = subject.takeoff?
    expect(plane.take_off).to be_truthy
  end
end
