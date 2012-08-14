# Update apt repository
package "apt" do
  notifies :run, "execute[apt-get update]", :immediately
end