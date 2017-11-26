require "spec_helper"

describe Commands::Left do
  let(:table) { Table.new 5,5 }
  subject { Robot.new(table) }

  describe '#execute' do
    it 'should not allow unitialized robot' do
      issue_left = ::Commands::Left.new(subject).execute
      expect(issue_left).to eq(::Msg::UNINITIALIZED)
      expect(subject.f).to be_nil
    end

    it 'should rotate 90 degrees to left' do
      subject.place('0,0,NORTH')
      expect(subject.f).to eq(:NORTH)
      subject.left
      expect(subject.f).to eq(:WEST)
    end
  end
end
