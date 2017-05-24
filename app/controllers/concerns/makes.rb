module Makes
  extend ActiveSupport::Concern


    def get_makes

      @makes.collect { |m| m["name"].upcase }

    end



end
