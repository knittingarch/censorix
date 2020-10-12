require "rails_helper"

RSpec.describe Category, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
