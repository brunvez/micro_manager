# frozen_string_literal: true

require_relative "../../lib/cli"

module MicroManager
  module CLI
    RSpec.describe CommandBuilder do
      context "with a today context" do
        it "builds a ListTasks command when there are no arguments" do
          builder = CommandBuilder.new(context: :today)
          input = []

          command = builder.build(input)

          expect(command).to be_a(ListTasks)
        end

        it "builds an AddTaskToday command when there is a description" do
          builder = CommandBuilder.new(context: :today)
          input = ["Code some stuff"]

          command = builder.build(input)

          expect(command).to be_a(AddTodayTask)
        end

        it "joins arguments for AddTaskToday" do
          builder = CommandBuilder.new(context: :today)
          input = %w[Code some stuff]
          schedule = Schedule.new

          command = builder.build(input)
          command.run(schedule: schedule)

          expect(schedule.outstanding_tasks.last.description).to eq("Code some stuff")
        end
      end
    end
  end
end
