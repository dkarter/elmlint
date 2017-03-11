module ElmLint
  # parses linting errors from elm-make
  class LintingError
    def initialize(data)
      @data = data
    end

    def to_str
      "#{filename}:#{linum}:#{col} [#{type}] #{overview}"
    end

    def linum
      data['region']['start']['line']
    end

    def col
      data['region']['start']['column']
    end

    def filename
      data['file']
    end

    def type
      data['type'][0].upcase
    end

    def overview
      data['overview']
    end

    private

    attr_reader :data
  end
end
