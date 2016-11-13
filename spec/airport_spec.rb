require "airport"

describe Airport do
  plane = Plane.new
  it 'instructs planes to land' do
    expect(subject.landed?(plane)).to eq true
  end

end
