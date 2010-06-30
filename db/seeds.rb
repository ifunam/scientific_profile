['Investigación', 'Publicaciones', 'Miembros', 'Servicios', 'Galerías'].each do |title|
  Navlink.create!(:title => title)
end

['Investigador', 'Investigador posdoctoral', 'Estudiante'].each do |name|
  Group.create(:name => name)
end

User.create(:email => 'admin@heaven.com', :password => 'soydios', :password_confirmation => 'soydios', :is_admin => true)