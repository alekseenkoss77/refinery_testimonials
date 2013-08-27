# coding: utf-8
module Refinery
  module Testimonials
    class TestimonialsController < ::ApplicationController

      before_filter :find_all_testimonials
      before_filter :find_page

      def index
        @testimonial = Testimonial.new
        present(@page)
      end

      def create
        @testimonial = Testimonial.new(params[:testimonial])
        if @testimonial.save
          flash[:notice] = "Отзыв успешно добавлен"
          redirect_to "/testimonials"
        else
          flash[:error] = "Не удалось добавить"
          render :index
        end
      end

    protected

      def find_all_testimonials
        @testimonials = Testimonial.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/testimonials").first
      end

    end
  end
end
