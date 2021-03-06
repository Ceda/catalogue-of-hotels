# == Schema Information
# Schema version: 20110114173256
#
# Table name: hotels
#
#  id                    :integer         not null, primary key
#  place_id              :integer
#  user_id               :integer
#  name                  :string(255)
#  description           :text
#  street                :string(255)
#  house_number          :string(255)
#  telephone             :text
#  fax                   :string(255)
#  distance              :integer
#  draft                 :boolean         default(TRUE), not null
#  paid_placement        :boolean         not null
#  banking_details       :text
#  created_at            :datetime
#  updated_at            :datetime
#  images_count          :integer         default(0), not null
#  confirmed             :boolean         not null
#  contract_file_name    :string(255)
#  contract_content_type :string(255)
#  contract_file_size    :integer
#

require 'spec_helper'

describe Hotel do
  pending "add some examples to (or delete) #{__FILE__}"
end
