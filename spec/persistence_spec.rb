# frozen_string_literal: true

require "ostruct"
require_relative "support/memory_store"

module MicroManager
  RSpec.describe Persistence do
    it "serializes and deserializes schedules" do
      config = Config.new(save_location: "~/some_place/file.yml")
      store = MemoryStore.new
      persistence = Persistence.new(config)
      tasks = [
        Task.new(description: "Task 1", due: Date.today.prev_day),
        Task.new(description: "Task 2", due: Date.today),
        Task.new(description: "Task 3", due: Date.today)
      ]
      schedule = Schedule.new(tasks: tasks)

      tasks.last.complete
      persistence.save(schedule, writer: store)
      recovered_schedule = persistence.recover(reader: store)

      expect(recovered_schedule.outstanding_tasks).to eq(tasks.first(2))
      expect(recovered_schedule.task_completed(on: Date.today)).to eq([tasks.last])
    end
  end
end
