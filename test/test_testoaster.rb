
require 'helper'
require 'testoaster'
require 'stringio'
 
module Kernel
 
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out.string
  ensure
    $stdout = STDOUT
  end
 
end

class Response
  
  attr_accessor :layout
  attr_accessor :body
  
end


class TestTestoaster < Test::Unit::TestCase
  
  should 'test puts!' do
    result = capture_stdout do
      puts! 'blah blah'
    end
    expected = "+++ +++\n\"blah blah\"\n"
    assert_equal expected, result
    
  end
  
  should 'test puts_each!' do
    arr = [ 1, 2, 3]
    result = capture_stdout do
      puts_each! arr
    end
    expected = "+++ +++\n1\n2\n3\n"
    assert_equal expected, result
  end
  
  should 'assert test_layout' do
    @response = Response.new
    @response.layout = 'layyy'
    
    assert_layout 'layyy'
    
  end
  
  should 'test t()' do
    result = t('users.test', 'test/en.yml')
    assert_equal 'Test', result
  end
  
  should 'test sign_in_path()' do
    assert_equal '/users/sign_in', sign_in_path
  end
  
  should 'test assert contains' do
    @r = Response.new
    @r.body = 'ttt'
    
    assert_contains @r.body, 'ttt'
  end
  
  should 'test todo' do
    begin
      todo
    rescue Exception => e
      assert_equal '@TODO: ', e.to_s
    end
  end
  
end
