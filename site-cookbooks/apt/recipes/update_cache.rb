# Update apt repository
package "apt" do
  notifies :run, "execute[apt-get update]", :immediately
end

package 'openjdk-7-jre' do
  action :install
end
