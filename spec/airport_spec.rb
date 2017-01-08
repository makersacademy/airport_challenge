require 'airport'


describe Airport do
  it 'instructs plane to land' do
  #it {is expected.to respond_to(:land).with(1).argument}
    #expect(subject).to respond_to(:land).with(1).argument
    expect(subject.land).to eq true
  end
  it 'instructs plane to take off' do
    #expect(subject).to respond_to(:take_off).with(1).argument
    expect(subject.take_off).to eq true
  end
end
