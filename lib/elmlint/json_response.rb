module ElmLint
  # Parses a json response from elm-make
  class JsonResponse
    def initialize(response_str)
      @response_str = response_str
    end

    def parse
      split_response = response_str.split "\n"
      output = ''

      split_response.each do |line|
        output += parse_json line + "\n"
      end

      output
    end

    def parse_json(line)
      json_array = JSON.parse line
      output = ''

      json_array.each do |json|
        err = LintingError.new json
        output += err.to_str + "\n"
      end

      output
    end

    private

    attr_reader :response_str
  end
end
