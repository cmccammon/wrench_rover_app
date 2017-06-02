module Edmunds_get
  extend ActiveSupport::Concern

    def get_makes
      @makes.collect { |m| m["name"] }
    end

    def get_models
      @models.collect { |m| m["name"] }
    end

    def get_years
        @get_years = *(1990..2017)
    end

end
