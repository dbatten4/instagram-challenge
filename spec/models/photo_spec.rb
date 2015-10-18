require 'rails_helper'

describe Photo, type: :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :favourites }
  it { is_expected.to belong_to :user }
end
