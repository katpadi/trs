require "spec_helper"

describe Commands::Right do
  let(:table) { Table.new 5,5 }
  subject { robot = Robot.new(table) }
  let(:placed_robot) do
    robot = subject
    robot.place('0,0,NORTH')
    robot
  end

  describe '#execute' do
    it 'should not allow unitialized robot' do
      issue_right = ::Commands::Right.new(subject).execute
      expect(issue_right).to eq(::Msg::UNINITIALIZED)
      expect(subject.f).to be_nil
    end

    it 'should rotate 90 degrees to right' do
      expect(placed_robot.f).to eq(:NORTH)
      placed_robot.right
      expect(placed_robot.f).to eq(:EAST)
    end

    it 'should not move its position' do
      subject_before = placed_robot
      placed_robot.right
      expect(placed_robot.x).to eq(subject_before.x)
      expect(placed_robot.y).to eq(subject_before.y)
    end
  end
end
