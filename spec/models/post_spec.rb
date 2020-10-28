require "rails_helper"

RSpec.describe Post, type: :model do
  describe "validations" do
    it { is_expected.to have_and_belong_to_many(:categories) }
    it { is_expected.to have_and_belong_to_many(:tags) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe ".most_recent_featured_post" do
    it "returns most recent featured post" do
      older_post = create(:post_with_categories_and_tags, featured: true, updated_at: 1.month.ago)
      recent_post = create(:post_with_categories_and_tags, featured: true)

      results = Post.most_recent_featured_post

      expect(results).to eq recent_post
      expect(results).not_to eq older_post
    end
  end
end
