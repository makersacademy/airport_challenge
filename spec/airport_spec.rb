require 'airport'
describe Airport do

  describe '#land(plane)' do
  # 'Should instruct planes to land at airport'
  it 'instructs planes to land at airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  describe '#take_off(plane)'
    # 'Should instruct planes to take off from airport and confirm they are not at the airport'
    it 'instructs planes to take off, and confirm they are not there' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
end 