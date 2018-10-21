class Question < ApplicationRecord
  validates_presence_of :content
  validates_presence_of :option1
  validates_presence_of :option2
  validates_presence_of :option3
  validates_presence_of :option4
  validates_presence_of :answer
  validates_presence_of :topic
  validates_presence_of :qtype
  validate :type_integrity_check

  mount_uploader :image, ImageUploader
 
  private
    #def image_size_validation
    #  errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    #end
    
    def type_integrity_check
      if (qtype == "True or False")
          if (answer == "option3" || answer == "option4")
            errors.add(:question, "True or False question can only have true or false as options.")
          end
      end
    end
  end