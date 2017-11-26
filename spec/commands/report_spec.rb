require "spec_helper"

describe Commands::Report do
  let(:table) { Table.new 5,5 }
  subject { Robot.new(table) }

  describe '#execute' do
    it 'should not allow unitialized robot' do
      issue_left = ::Commands::Report.new(subject).execute
      expect(issue_left).to eq(::Msg.error(::Msg::UNINITIALIZED))
      expect(subject.f).to be_nil
    end

    it 'should report current position' do
      subject.place('0,0,EAST')
      report = subject.report
      expect(report).to eq("X: #{subject.x}, Y: #{subject.y}, F: #{subject.f}")
      subject.left
      subject.move
      expect(subject.f).to eq(:NORTH)
      expect(subject.x).to eq(0)
      expect(subject.y).to eq(1)
    end
  end
end
