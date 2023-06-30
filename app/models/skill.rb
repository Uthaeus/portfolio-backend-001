class Skill < ApplicationRecord
    validates_presence_of :title, :percent_utilized
    
    mount_uploader :icon_image, SkillUploader
end
