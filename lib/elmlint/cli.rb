require 'open3'

module ElmLint
  # provides command line interface for elmlint
  class CLI
    attr_reader :filepath

    def initialize(filepath)
      @filepath = filepath
    end

    def find_project_root
      parts = filepath.split('/')
      found = []

      while parts.any? && found.empty?
        parts.pop
        dir = parts.join '/'
        found = Dir["#{dir}/elm-package.json"] if Dir.exist?(dir)
      end

      parts.join('/')
    end

    def execute
      root = find_project_root

      Dir.chdir(root) unless root.empty?

      stdout, stderr, status =
        Open3.capture3 "elm-make #{filepath} --warn --report=json --output /dev/null"

      response_str = (stdout.empty? ? stderr : stdout)

      exit_code = status.exitstatus

      if exit_code != 0
        puts clean_output(parse(response_str))
      end
      exit exit_code
    end

    def clean_output(output)
      # remove empty lines
      output.gsub(/^$\n/, '')
    end

    def parse(response_str)
      response = if json?(response_str)
                   JsonResponse.new response_str
                 else
                   NonJsonResponse.new filepath, response_str
                 end
      response.parse
    end

    def json?(str)
      str.to_s.chars.first == '['
    end
  end
end
