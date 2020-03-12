class Review < ApplicationRecord
  belongs_to :user
  belongs_to :deck

  def reviews_with_content
    self.where.not(content: nil).count
  end
end
