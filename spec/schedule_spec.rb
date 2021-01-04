# frozen_string_literal: true

module MicroManager
  RSpec.describe Schedule do
    it "has a list of outstanding tasks" do
      outstanding_tasks = [
        Task.new(description: "Task 1", due: Date.today.prev_day),
        Task.new(description: "Task 2", due: Date.today)
      ]
      future_tasks = [
        Task.new(description: "Task 2", due: Date.today.next_day)
      ]
      schedule = Schedule.new(tasks: outstanding_tasks + future_tasks)

      expect(schedule.outstanding_tasks).to eq(outstanding_tasks)
    end

    it "orders outstanding tasks by their age" do
      newest_task = Task.new(description: "Newest task", due: Date.today)
      oldest_task = Task.new(description: "Oldest task", due: Date.today.prev_day)
      outstanding_tasks = [newest_task, oldest_task]
      schedule = Schedule.new(tasks: outstanding_tasks)

      expect(schedule.outstanding_tasks).to eq([oldest_task, newest_task])
    end

    it "returns tasks completed on a day" do
      desired_task = Task.new(description: "Looking for this", due: Date.today.prev_day)
      other_task = Task.new(description: "Extra setup", due: Date.today)
      tasks = [desired_task, other_task]
      schedule = Schedule.new(tasks: tasks)
      
      desired_task.complete
      
      expect(schedule.task_completed(on: Date.today)).to eq([desired_task])
    end

    it "adds tasks as outstanding" do
      schedule = Schedule.new

      schedule.add_task(description: "New task", due: Date.today)

      expect(schedule.outstanding_tasks.count).to eq(1)
      expect(schedule.outstanding_tasks.first.description).to eq("New task")
    end
  end
end

