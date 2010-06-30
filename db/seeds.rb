['Investigación', 'Publicaciones', 'Miembros', 'Servicios', 'Galerías'].each do |title|
  Navlink.create!(:title => title)
end

['Investigador', 'Investigador posdoctoral', 'Estudiante'].each do |name|
  Group.create(:name => name)
end