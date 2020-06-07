class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item, counter_cache: :favorites_count
  validates :user_id, uniqueness: { scope: :item_id }
end
