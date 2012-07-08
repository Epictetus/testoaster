

def puts! arg
  puts '+++ +++'
  puts arg.inspect
end

def puts_each! arg
  puts '+++ +++'
  arg.each do |e|
    puts e.inspect
  end
end

def todo msg = ''
  assert false, '@TODO: ' + msg
end

begin
  Paperclip.options[:log] = false
rescue
end

def assert_layout layout
  assert_equal layout, @response.layout
end

def t which, addr = 'config/locales/en.yml'
  file = YAML::load(File.open(addr))
  file = file["en"]
  
  arr = which.split('.')
  arr.each do |a|
    file = file[a]
  end
  
  file
end

def sign_in_path
  '/users/sign_in'
end

def assert_contains th

  b = @response.body
    
  if b =~ /#{Regexp.quote(th)}/
    assert true
  else
    assert false
  end
  
end