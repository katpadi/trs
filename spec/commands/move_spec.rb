require "spec_helper"

describe Commands::Move do
  let(:table) { Table.new 5,5 }
  subject { Robot.new(table) }

  describe '#execute' do
    it 'should not allow unitialized robot' do
      issue_left = ::Commands::Move.new(subject).execute
      expect(issue_left).to eq(::Msg.error(::Msg::UNINITIALIZED))
      expect(subject.f).to be_nil
    end

    it 'should rotate 90 degrees to left' do
      subject.place('0,0,NORTH')
      subject_before = subject
      subject.move
      subject.move
      subject.move
      expect(subject.y).to eq(3)
      expect(subject.x).to eq(subject_before.x)
      expect(subject.f).to eq(subject_before.f)
    end

    it 'should not go beyond the table' do
      subject.place('4,4,NORTH')
      subject_before = subject
      result = subject.move
      expect(result).to eq(::Msg.error(::Msg::OUT_OF_BOUNDS))
      expect(subject.y).to eq(subject_before.y)
      expect(subject.x).to eq(subject_before.x)
      expect(subject.f).to eq(subject_before.f)
    end
  end
end
