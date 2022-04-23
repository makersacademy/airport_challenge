describe Airport do
  describe '#land' do
    it { should respond_to(:land) }

    it { should respond_to(:land).with(1) }
  end
end