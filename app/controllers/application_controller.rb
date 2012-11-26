class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_banner, :find_articles, :find_cart, :find_menu
  
  private

    def find_banner
      @banner = Banner.where("#{Random.rand}").first
    end

    def find_articles
      @articles = Article.where(to_main_block: true).where("#{Random.rand}").limit(2)
    end

    def find_cart
      #session[:cart] = nil
      @cart = session[:cart] ||= Cart.new
    end

    def find_menu
      @menu_items = MenuItem.where parent_id: nil
    end

end
