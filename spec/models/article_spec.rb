require "rails_helper"

RSpec.describe Article, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to validate_presence_of(:content) }
  end
end
