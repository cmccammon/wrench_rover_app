module Edmunds_get
  extend ActiveSupport::Concern

    def get_makes
      @makes.collect { |m| m["name"] }
    end

    def get_models
      @models.collect { |m| m["name"] }
    end

    def get_years
      @get_years = *(1990..Time.new.year)
    end

end
