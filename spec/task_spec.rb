# frozen_string_literal: true

module MicroManager
  RSpec.describe Task do
    let(:task) { Task.new(description: "Fix MicroManager's bugs", due: Date.today) }

    it "has a description" do
      expect(task.description).to eq("Fix MicroManager's bugs")
    end

    it "has a due date" do
      expect(task.due).to eq(Date.today)
    end

    it "can be completed" do
      expect { task.complete }.to change { task.completed? }.from(false).to(true)
    end

    it "knows the completion date" do
      task.complete

      expect(task.completed_on).to eq(Date.today)
    end
  end
end

