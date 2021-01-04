# frozen_string_literal: true

require_relative "../../lib/cli"

module MicroManager
  module CLI
    RSpec.describe AddTodayTask do
      it "adds a task for today to a schedule" do
        schedule = Schedule.new
        command = AddTodayTask.new(description: "Something to do today")

        command.run(schedule: schedule)

        expect(schedule.outstanding_tasks.count).to eq(1)
        schedule.outstanding_tasks.first.tap do |task|
          expect(task.description).to eq("Something to do today")
          expect(task.due).to eq(Date.today)
        end
      end

      it "returns a success message" do
        schedule = Schedule.new
        command = AddTodayTask.new(description: "Something to do today")

        result = command.run(schedule: schedule)

        expect(result).to eq("Task added successfully")
      end
    end
  end
end

