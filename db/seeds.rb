['Investigación', 'Publicaciones', 'Miembros', 'Servicios', 'Galerías'].each do |title|
  Navlink.create!(:title => title)
end

['Investigador', 'Colaboradores', 'Estudiante'].each do |name|
  Group.create(:name => name)
end

User.create(:email => 'admin@heaven.com', :password => 'soydios', :password_confirmation => 'soydios', :is_admin => true)

['Aceptado', 'Enviado', 'En preparación', 'Publicado'].each do |name|
  ArticleStatus.create(:name => name)
end

['Applied Physics B', 'Classical and Quantum Gravity', 'Physical Review A'].each do |name|
  Journal.create(:name => name)
end

['Universidad Nacional Autónoma de México'].each do |name|
  Institution.create(:name => name)
end

['Licenciatura', 'Maestría', 'Doctorado', 'Otro'].each do |name|
  AcademicLevel.create(:name => name)
end

['Autor', 'Director', 'Asesor', 'Tutor'].each do |name|
  RoleInThesis.create(:name => name)
end