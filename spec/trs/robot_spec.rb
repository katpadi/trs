require "spec_helper"


describe Robot do
  let(:table) { Table.new 5,5 }
  subject { Robot.new(table) }

  describe '#initialize' do
    it 'should be initialized with nil values' do
      expect(subject.x).to be_nil
      expect(subject.y).to be_nil
      expect(subject.f).to be_nil
      expect(subject.i).to be_nil
    end

    it 'should have a table instance' do
      expect(subject.table).to_not be_nil
    end
  end

  describe '#place' do
    it 'should be placed in 2,2,NORTH' do
      subject.place('2,2,NORTH')
      expect(subject.f).to eq(:"NORTH")
    end
  end

  describe '#move' do
    it 'should move forward' do
      subject.place('2,2,NORTH')
      subject.move
      expect(subject.x).to eq(2)
      expect(subject.y).to eq(3)
      expect(subject.f).to eq(:"NORTH")
    end
  end

  describe '#left' do
    it 'should rotate 90 degrees to left' do
      subject.place('2,2,NORTH')
      subject.left
      expect(subject.f).to eq(:"WEST")
    end

    it 'should rotate to 180 degrees to left' do
      subject.place('2,2,NORTH')
      subject.left
      subject.left
      expect(subject.f).to eq(:"SOUTH")
    end
  end

  describe '#right' do
    it 'should rotate 90 degrees to right' do
      subject = Robot.new(Table.new(5,5))
      subject.place('2,2,EAST')
      subject.right
      expect(subject.f).to eq(:"SOUTH")
    end

    it 'should rotate to 180 degrees to right' do
      subject.place('2,2,EAST')
      subject.right
      subject.right
      expect(subject.f).to eq(:"WEST")
    end
  end
end

