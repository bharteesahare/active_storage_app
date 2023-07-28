class Pin < ApplicationRecord
  has_one_attached :image
  has_many_attached :documents
  has_rich_text :body

  def image_as_thumbnail
    image.variant(resize_to_limit: [300, 300]).processed
  end

  def picture_as_thumbnail
    documents.map do |document|
      document.variant(resize_to_limit: [150, 150]).processed
    end
  end
end
