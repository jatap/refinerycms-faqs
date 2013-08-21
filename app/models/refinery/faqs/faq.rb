# Faq Controller
#
# @authors julio.antunez.tarin@gmail.com, Christian Rijke
#
module Refinery
  module Faqs
    class Faq < Refinery::Core::BaseModel
      self.table_name = 'refinery_faqs'
      
      # Accessibles
      attr_accessible :question, :answer, :position

      # Search indexing
      acts_as_indexed fields: [:question, :answer]
      alias_attribute :title, :question

      # Validations
      validates :question, presence: true, uniqueness: true
      
      # URL Action.
      #
      # @return [String] new URL string, including faq id
      def url
        "faqs/#{id}"
      end
    end
  end
end
