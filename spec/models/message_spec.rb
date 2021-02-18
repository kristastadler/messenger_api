require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "relationships" do
    it {should belong_to :sender}
    it {should belong_to :recipient}
  end
end
