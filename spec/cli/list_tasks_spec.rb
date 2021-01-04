# frozen_string_literal: true

require_relative "../../lib/cli"

module MicroManager
  module CLI
    RSpec.describe ListTasks do
      it "returns a table with the tasks" do
        tasks = [
          Task.new(description: "Task 1", due: Date.today),
          Task.new(description: "Task 2", due: Date.today).tap(&:complete)
        ]
        schedule = Schedule.new(tasks: tasks)
        command = ListTasks.new

        result = command.run(schedule: schedule)

        today_s = Date.today.to_s
        expect(result).to eq(
          <<~TABLE.chomp
            ┌─────┬─────────────┬────────────┐
            │     │ Description │ Due        │
            ├─────┼─────────────┼────────────┤
            │ [ ] │ Task 1      │ #{today_s} │
            │ [X] │ Task 2      │ #{today_s} │
            └─────┴─────────────┴────────────┘
          TABLE
        )
      end
    end
  end
end
