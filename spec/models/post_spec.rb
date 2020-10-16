require "rails_helper"

RSpec.describe Post, type: :model do
  describe "validations" do
    it { is_expected.to have_and_belong_to_many(:tags) }
    it { is_expected.to have_many(:categories) }
    it { is_expected.to have_one(:article) }
    it { is_expected.to validate_presence_of(:title) }
  end
end
