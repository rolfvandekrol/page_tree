# Based on https://gist.github.com/bantic/5688232

module PageTree
  class RoutesRecognizer
    attr_reader :paths
 
    INITIAL_SEGMENT_REGEX = %r{^\/([^\/\(:]+)}
 
    def initialize(engine)
      routes = engine.routes.routes
      @paths = routes.collect {|r| r.path.spec.to_s }
    end
 
    def initial_path_segments
      @initial_path_segments ||= begin
        paths.collect {|path| match_initial_path_segment(path)}.compact.uniq
      end
    end
 
    def match_initial_path_segment(path)
      if match = INITIAL_SEGMENT_REGEX.match(path)
        match[1]
      end
    end
  end
end