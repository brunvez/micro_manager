# frozen_string_literal: true

module MicroManager
  RSpec.describe Config do
    it "has default values" do
      allow(Dir).to receive(:home).and_return("/Users/john")
      config = Config.new

      expect(config.save_location).to eq("/Users/john/.micro_manager/schedule.yml")
    end
  end
end
