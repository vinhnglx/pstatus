module Pstatus
  class PrettyStatus

    def initialize status_code
      @status_code = status_code
    end

    def get_status_msg
      if @status_code
        if Pstatus::MESSAGE[@status_code.to_i]
          return Pstatus::MESSAGE[@status_code.to_i]
        else
          raise("This status code does not exist. Please check again!")
        end
      else
        raise("Missing parameter status_code.")
      end
    end

  end
end
