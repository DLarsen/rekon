# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  prompt_id  :integer
#  answer     :text
#  created_at :datetime
#  updated_at :datetime
#

class Reply < ActiveRecord::Base
end
