class Permit < ApplicationRecord
    belongs_to :project
    belongs_to :contractor, :class_name => "User", :foreign_key => "user_id" 
end
