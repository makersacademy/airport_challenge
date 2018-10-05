require 'airport'


describe Airport do
  it { is_expected.to respond_to :land }

  it 'returns the plane has landed' do
    plane = Plane.new
    expect(subject.land(plane)).not_to eq nil
  end

    it 'returns plane didn\'t take off due to bad weather!' do
    expect{subject.take_off}.to raise_error "Can/'t take off due to bad weather!"
  end

  it 'returns plane has taken off' do
    plane = Plane.new
    expect(subject.take_off(plane)).not_to eq nil
  end

end
