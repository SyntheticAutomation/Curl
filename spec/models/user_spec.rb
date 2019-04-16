require 'rails_helper'

describe User do
  context "validations & relationships" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:username) }
  end
end