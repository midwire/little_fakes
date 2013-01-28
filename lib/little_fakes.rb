require "little_fakes/version"

# A simple mocking library for SSH sessions
#
# You must create a datafile in "#{PROJECT_ROOT}/spec/fixtures/little_fakes/*"
# that contains the data that should be returned from the Net::SSH::Connection.exec! method
#
# The datafile naming convention is as follows:
#
# descriptive_tag_with_underscores-object_method-arg1+arg2+arg3.filetype
#
# Example:
# successful_verbose-lookup-{case_number=574491}.ascii
#
module LittleFakes

  def self.root
    File.expand_path '../..', __FILE__
  end

  class SSHSessionDouble
    def initialize(return_data)
      @return_data = return_data
    end

    def exec!(cmd)
      channel = nil
      stream = :stdout
      if block_given?
        yield channel, stream, @return_data
      else
        @return_data
      end
    end
  end

  # Call it like this:
  # with_little_fake("successful-lookup-{#{id_name}=#{value}}.ascii", false) do
  #   lambda {
  #     data = app.lookup({"#{id_name}" => value})
  #   }.should_not raise_error
  # end.should match(/case_number: \"?#{614634}\"?/)
  def with_little_fake(filename, session_block = true, &block)
    unless block_given?
      raise "You must pass a block."
    end

    content_type           = File.extname(filename)
    basename               = filename.gsub(/#{content_type}/, '')
    tag, method, arguments = basename.split('-')
    argument_array         = arguments.split('+')
    new_arg_array          = []

    argument_array.each do |arg|
      if arg =~ /\=/
        # convert to a hash
        name, value = arg.gsub(/[{}]/, '').split(/\=/)
        stringified = "{#{name}: '#{value}'}"
        arg = eval(stringified)
      end
      new_arg_array << arg
    end

    # load the data
    abs_filename = "#{LittleFakes::root}/spec/fixtures/little_fakes/#{filename}"
    data         = File.read(abs_filename)
    session      = SSHSessionDouble.new(data)

    # Determine if we are using persistent sessions
    #  Net::SSH.start(host, username, params, &block)
    #   which needs 'Net::SSH.stub(:start).and_yield(session)'
    # vs.
    #  Net::SSH.start(host, username, params)
    #   which needs 'Net::SSH.stub(:start).and_return(session)'
    if session_block
      Net::SSH.stub(:start).and_yield(session)
    else
      Net::SSH.stub(:start).and_return(session)
    end
    yield
    data
  end

end
