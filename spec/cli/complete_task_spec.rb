# frozen_string_literal: true

module MicroManager
  module CLI
    RSpec.describe CompleteTask do
      it "marks a task as completed" do
        task_to_complete = Task.new(description: "Task to complete", due: Date.today)
        other_task = Task.new(description: "Other task", due: Date.today)
        schedule = Schedule.new(tasks: [task_to_complete, other_task])
        test_prompt = double(:prompt, select: task_to_complete)
        command = CompleteTask.new(prompt: test_prompt)

        command.run(schedule: schedule)

        expect { command.run(schedule: schedule).render }.to change(task_to_complete, :completed?)
      end
    end
  end
end
