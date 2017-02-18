require 'weather'

  describe Weather do

    before do
      @airport = Airport.new
      @plane = Plane.new
      allow(@airport).to receive(:stormy?).and_return(true)
    end

  subject(:weather) { described_class.new }

  it {is_expected.to respond_to(:conditions) }
  it {is_expected.to respond_to(:stormy?) }

  it 'Checks if an array has been created for @condition' do
    expect(subject.conditions).to be_kind_of(Array)
  end

  it 'can change weather' do
end

end
