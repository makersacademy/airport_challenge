require 'airport'


describe Airport do
  it 'instructs plane to land' do
  #it {is expected.to respond_to(:land).with(1).argument}
    expect(subject).to respond_to(:land).with(1).argument
  end
end
