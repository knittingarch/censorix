require "rails_helper"

RSpec.describe Post, type: :model do
  describe "validations" do
    it { is_expected.to have_one(:article) }
    it { is_expected.to validate_presence_of(:published_at) }
    it { is_expected.to validate_presence_of(:title) }
  end
end
