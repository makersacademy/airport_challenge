require "airport"

describe Airport do

  it { is_expected.to respond_to :landed}

  it 'confirms a plane has landed' do
    plane = Plane.new
    expect(subject.landed).to eq true
  end

end
