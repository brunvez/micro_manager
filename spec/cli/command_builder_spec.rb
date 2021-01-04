# frozen_string_literal: true

require_relative "../../lib/cli"

module MicroManager
  module CLI
    RSpec.describe CommandBuilder do
      it "builds a ListTasks command when there are no arguments" do
        builder = CommandBuilder.new
        input = []

        command = builder.build(input)

        expect(command).to be_a(ListTasks)
      end

      it "builds an AddTask command when there is a description" do
        builder = CommandBuilder.new
        input = ["Code some stuff"]

        command = builder.build(input)

        expect(command).to be_a(AddTask)
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
