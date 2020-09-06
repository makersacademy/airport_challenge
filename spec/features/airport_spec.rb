require 'Airport'
describe Airport do
  subject(:airport) { described_class.new}  # 'subject is the class described.new'
    # 'is expected to respond to method land with one argument'
  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land). with(1).argument
   
  end
end