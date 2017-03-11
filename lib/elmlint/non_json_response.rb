module ElmLint
  # Parses a non JSON response from elm-make
  class NonJsonResponse
    def initialize(filename, response_str)
      @filename = filename
      @response_str = response_str
    end

    def parse
      # just return response string for now
      # get first line, set linum and col to 1
      "#{filename}:1:1 [E] #{overview}"
    end

    def overview
      split_response = response_str.split "\n"
      split_response[0]
    end

    private

    attr_reader :filename, :response_str
  end
end
