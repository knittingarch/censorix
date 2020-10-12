require "rails_helper"

FactoryBot.factories.map(&:name).each do |factory_name|
  describe "#{factory_name} factory" do
    it "is valid" do
      factory = build(factory_name)

      if factory.respond_to?(:valid?)
        expect(factory).to be_valid
      end
    end
  end
end
