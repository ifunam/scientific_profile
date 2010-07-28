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

['Publicado', 'En prensa', ' Aceptado para publicación', 'En edición', 'En dictamén o evaluación', 'En preparación'].each do |name|
  EditionStatus.create(:name => name)
end

['Autor', 'Coautor', 'Revisor', 'Traductor', 'Editor', 'Compilador', 'Coordinador', 'Otro'].each do |name|
  RoleInEdition.create(:name => name)
end

['Autor', 'Coautor', 'Revisor', 'Traductor'].each do |name|
  RoleInChapter.create(:name => name)
end

%w(Introducción Prefacio Prólogo Capítulo Apéndice Índice Otro).each do |name|
  ChapterType.create(:name => name)  
end

['Poster', 'Notas de clase', 'Presentación', 'Otro'].each do |name|
  PublicationType.create(:name => name)  
end