require 'rails_helper'

RSpec.describe Meme do
 it { should validate_presence_of(:name) }
 it { is_expected.to validate_presence_of(:tag) }
 it { should have_and_belong_to_many(:users) }
end
