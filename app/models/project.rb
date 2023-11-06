class Project < ApplicationRecord

    has_many :project_users,dependent: :destroy
    has_many :users,through: :project_users,dependent: :destroy

    accepts_nested_attributes_for :project_users,allow_destroy: true,reject_if: :all_blank

    has_many :bugs, dependent: :destroy, inverse_of: :project
   
    def self.group_by_day_created_at
        group_by_day(:created_at).count
      end

end
