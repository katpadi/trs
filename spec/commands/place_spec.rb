require "spec_helper"

describe Commands::Place do
  let(:table) { Table.new 5,5 }
  subject { Robot.new(table) }

  describe '#execute' do
    it 'should place the robot 2,2,SOUTH' do
      subject.place('2,2,SOUTH')
      expect(subject.y).to eq(2)
      expect(subject.x).to eq(2)
      expect(subject.f).to eq(:SOUTH)
    end

    it 'should not go beyond the table' do
      subject_before = subject
      result = subject.place('5,5,NORTH')
      expect(result).to eq(::Msg.error(::Msg::OUT_OF_BOUNDS))
      expect(subject.y).to eq(subject_before.y)
      expect(subject.x).to eq(subject_before.x)
      expect(subject.f).to eq(subject_before.f)
    end
  end
end
