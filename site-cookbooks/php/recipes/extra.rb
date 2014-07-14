package 'php5-intl' do
  action :install
end

package 'php5-mcrypt' do
  action :install
end

# Copy .ini files
[:memory, :timezone].each do |m|
  template "/etc/php5/mods-available/#{m}.ini" do
    source "#{m}.ini"
    mode 0644
  end
end

# Enable modules in cli
[:memory, :timezone, :mcrypt].each do |m|
  link "/etc/php5/cli/conf.d/#{m}.ini" do
    to "/etc/php5/mods-available/#{m}.ini"
  end
end

# Enable modules in apache
[:timezone, :mcrypt].each do |m|
  link "/etc/php5/apache2/conf.d/#{m}.ini" do
    to "/etc/php5/mods-available/#{m}.ini"
  end
end
