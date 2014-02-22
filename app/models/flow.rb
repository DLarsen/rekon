# == Schema Information
#
# Table name: flows
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Flow < ActiveRecord::Base
  has_many :sections
end
