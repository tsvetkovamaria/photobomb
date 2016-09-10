class Photo < ApplicationRecord

  belongs_to :user
  has_many :user_comments
  
  validates :name, presence: true, length: {maximum: 250}

  has_attached_file :image,
                    styles: {medium: '600x600>', thumb: '100x100' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                        content_type: ['image/jpeg', 'image/gif', 'image/png']

  validates :image, presence: true

end
