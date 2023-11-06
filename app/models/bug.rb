class Bug < ApplicationRecord
    belongs_to :project
    has_one_attached :image

    validate :image_format

  private

  def image_format
    return unless image.attached?

    if !image.blob.content_type.in?(%w(image/png image/gif))
      errors.add(:image, 'must be a PNG or GIF')
    end
  end
   
    resourcify

    has_many :users, through: :roles, class_name: 'User', source: :users
    has_many :creator, -> { where(roles: {name: :creator}) }, through: :roles, class_name: 'User', source: :users
    has_many :developers, -> { where(roles: {name: :editor}) }, through: :roles, class_name: 'User', source: :users

end
