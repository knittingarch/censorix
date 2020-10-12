require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "validations" do
    it { is_expected.to have_many(:posts) }
  end
end
