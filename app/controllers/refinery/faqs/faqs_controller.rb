# Faqs Module
#
# @authors julio.antunez.tarin@gmail.com, Christian Rijke
#
module Refinery
  module Faqs
    class FaqsController < ::ApplicationController

      # Index action.
      def index
        @faqs = Faq.order('position ASC')
        prepare_page_presentation
      end
      
      # Show action.
      def show
        @faq = Faq.find_by_id(params[:id])
        redirect_to(refinery.faqs_faqs_path) and return if @faq.nil?
        prepare_page_presentation
      end
      
      # Prepare page presentation
      def prepare_page_presentation
        @page = ::Refinery::Page.where(:link_url => "/faqs").first
        present(@page)
      end
      private :prepare_page_presentation
      
    end
  end
end
