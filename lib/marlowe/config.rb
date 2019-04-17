# frozen_string_literal: true

# Configuration object for Marlowe.
class Marlowe::Config
  # The name of the default header to look for and put the correlation id in.
  CORRELATION_HEADER = 'X-Request-Id' #:nodoc:

  class << self
    # The global Marlowe configuration.
    def global
      @global ||= new
    end

    # Override the global Marlowe configuration.
    def override(opts)
      new(global, opts)
    end

    def configure(&block) # :nodoc:
      @global = new(global, &block)
    end

    private

    def clear_global!
      @global = nil
    end
  end

  # The name of the header to inspect. Defaults to 'X-Request-Id'.
  attr_accessor :header
  # The HTTP formatted version of the header name to inspect. Defaults to
  # 'HTTP_X_REQUEST_ID'.
  attr_reader :http_header
  # The handler for request correlation IDs. Defaults to sanitizing provided
  # request IDs or generating a UUID. If <tt>:simple</tt> is provided, provided
  # request IDs will not be sanitized. A callable (expecting a single input of
  # any possible existing request ID) may be provided to introduce more complex
  # request ID handling.
  attr_accessor :handler
  # If +true+ (the default), the request correlation ID will be returned as
  # part of the response headers. Only affects Marlowe::Middleware.
  attr_accessor :return
  # If +true+, Marlowe will add code to behave like
  # <tt>ActionDispatch::RequestId</tt>. Depends on
  # <tt>ActionDispatch::Request</tt>. Only affects Marlowe::Middleware.
  attr_accessor :action_dispatch

  # === Option Values
  #
  # <tt>:header</tt>:: The name of the header to inspect. Defaults to
  #                    'X-Request-Id'. Also available as
  #                    <tt>:correlation_header</tt>.
  # <tt>:handler</tt>:: The handler for request correlation IDs. Defaults to
  #                     sanitizing provided request IDs or generating a UUID.
  #                     If <tt>:simple</tt> is provided, provided request IDs
  #                     will not be sanitized. A callable (expecting a single
  #                     input of any possible existing request ID) may be
  #                     provided to introduce more complex request ID
  #                     handling.
  # <tt>:return</tt>:: If +true+ (the default), the request correlation ID
  #                    will be returned as part of the response headers.
  # <tt>:action_dispatch</tt>:: If +true+, Marlowe will add code to behave
  #                             like <tt>ActionDispatch::RequestId</tt>.
  #                             Depends on <tt>ActionDispatch::Request</tt>.
  def initialize(base = nil, opts = nil) # :yields: self
    opts =
      if base.nil? && opts.nil?
        {}
      elsif base.nil? && opts.kind_of?(Hash)
        opts
      elsif base.kind_of?(Hash) && opts.nil?
        base
      elsif base.kind_of?(self.class) && opts.nil?
        base.to_hash
      elsif (base.kind_of?(Hash) || base.kind_of?(self.class)) && opts.kind_of?(Hash)
        hash =
          if base.kind_of?(self.class)
            base.to_hash
          else
            base
          end
        hash.update(opts)
      end

    @header, @http_header = format_header_name(
      opts[:header] || opts[:correlation_header] || CORRELATION_HEADER
    )

    @handler = opts.fetch(:handler, :clean)
    @return = opts.fetch(:return, true)
    @action_dispatch = opts.fetch(:action_dispatch, false)

    yield self if block_given?

    freeze
  end

  def to_hash
    {
      header: header,
      handler: handler,
      return: self.return,
      action_dispatch: action_dispatch
    }
  end

  private

  def format_header_name(header)
    [
      header.to_s.tr('_', '-').freeze,
      "HTTP_#{header.to_s.tr('-', '_').upcase}"
    ]
  end
end
