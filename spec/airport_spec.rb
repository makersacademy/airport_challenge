require 'airport'

describe Airport do
  it {is_expected.to respond_to(:land)}
  it {is_expected.to respond_to(:take_off).with(1).argument}

  it 'confims plane has landed' do
    plane = subject.land
    expect(plane).to be_landed
  end


end
