class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :project_users,dependent: :destroy
  has_many :projects,through: :project_users,dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



       

         def full_name
          "#{name} - #{user_type}"
        end

         #attr_accessor :name

         validates :name, presence: true
         validates :user_type, presence: true

         enum user_type: { Manager: "Manager", Developer: "Developer", QA: "QA" }

         has_many :creator_bugs, -> { where(roles: {name: :creator}) }, through: :roles, source: :resource, source_type: :Bug
         has_many :editor_bugs, -> { where(roles: {name: :editor}) }, through: :roles, source: :resource, source_type: :Bug
end
