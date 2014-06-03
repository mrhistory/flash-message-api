module FlashMessageAPI

  class FlashMessage
    attr_accessor :message
    attr_reader :id

    def initialize(params)
    end

    def to_json
      hash = {
      }
      hash[:_id] = @id unless @id.nil?
      hash.to_json
    end
  end

end