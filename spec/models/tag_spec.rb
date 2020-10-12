require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:post) }
  end
end
