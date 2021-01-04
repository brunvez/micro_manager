# frozen_string_literal: true

require_relative "../../lib/cli"

module MicroManager
  module CLI
    RSpec.describe CommandBuilder do
      it "buils a ShowHelp command when prompting for help" do
        builder = CommandBuilder.new
        input = ["--help"]

        command = builder.build(input)
        result = command.run(schedule: nil)

        expect(command).to be_a(ShowHelp)
        expect(result).to eq(
          <<-HELP
Usage: just [task-description] [options]
    -d, --due [DATE]                 Date to which the task is due, defaults to Date.today. Supports relative dates (e.g. 1-day, 2-weeks, etc)
    -l, --list-tasks                 Lists all due tasks and tasks completed today
    -h, --help                       Prints this help
          HELP
        )
      end

      it "builds a ListTasks command when there are no arguments" do
        builder = CommandBuilder.new
        input = []

        command = builder.build(input)

        expect(command).to be_a(ListTasks)
      end

      it "builds a ListTasks command when given --list-tasks input" do
        builder = CommandBuilder.new
        input = ["--list-tasks"]

        command = builder.build(input)

        expect(command).to be_a(ListTasks)
      end

      it "builds an AddTask command when there is a description" do
        builder = CommandBuilder.new
        input = ["Code some stuff"]

        command = builder.build(input)

        expect(command).to be_a(AddTask)
      end

      it "can parse a due date" do
        builder = CommandBuilder.new
        input = ["Code some stuff", "--due", "2021-01-01"]
        schedule = spy(Schedule)

        command = builder.build(input)
        command.run(schedule: schedule)

        expect(schedule).to have_received(:add_task).with(description: "Code some stuff", due: Date.new(2021, 1, 1))
      end

      it "accepts a shorthand for the due date" do
        builder = CommandBuilder.new
        input = ["Code some stuff", "-d", "2021-01-01"]
        schedule = spy(Schedule)

        command = builder.build(input)
        command.run(schedule: schedule)

        expect(schedule).to have_received(:add_task).with(description: "Code some stuff", due: Date.new(2021, 1, 1))
      end

      it "allows sending time relative dates" do
        dates = [
          ["1-day", Date.today.next_day],
          ["3-days", Date.today + 3],
          ["1-week", Date.today + 7],
          ["2-weeks", Date.today + 14],
          ["1-month", Date.today + 30],
          ["2-months", Date.today + 60]
        ]
        dates.each do |date_input, expected_date|
          builder = CommandBuilder.new
          input = ["Code some stuff due in #{date_input}", "-d", date_input]
          schedule = spy(Schedule)

          command = builder.build(input)
          command.run(schedule: schedule)

          expect(schedule).to have_received(:add_task).with(description: input.first, due: expected_date)
        end
      end

      it "has a defualt of today for the due date" do
        builder = CommandBuilder.new
        input = ["Code some stuff"]
        schedule = spy(Schedule)

        command = builder.build(input)
        command.run(schedule: schedule)

        expect(schedule).to have_received(:add_task).with(description: "Code some stuff", due: Date.today)
      end

      it "joins arguments for AddTask" do
        builder = CommandBuilder.new
        input = %w[Code some stuff]
        schedule = spy(Schedule)

        command = builder.build(input)
        command.run(schedule: schedule)

        expect(schedule).to have_received(:add_task).with(description: "Code some stuff", due: Date.today)
      end
    end
  end
end
