# frozen_string_literal: true

require_relative "../../lib/cli"

module MicroManager
  module CLI
    RSpec.describe CommandBuilder do
      context "with a today context" do
        it "builds an AddTaskToday command" do
          builder = CommandBuilder.new(context: :today)
          input = ["Code some stuff"]

          command = builder.build(input)

          expect(command).to be_a(AddTodayTask)
        end
      end
    end
  end
end
