use chwapaw;


insert into person(id, firstname, lastname, gender, uuid)
values(1, 'Super', 'Admin', 'm', uuid());


insert into groups(id, name, code, description, default_page, pass_exp_limit, uuid)
values(1, 'Super Administrateur', 'super', 'Le groupe qui peut tout faire', 'user/admin.cp', null, uuid());

insert into groups(id, name, code, description, default_page, pass_exp_limit, uuid)
values(2, 'Groupe par défaut', 'default', 'Groupe des utilisateurs en attente', null, null, uuid());


insert into menu(id, code, position, url, path, parent_id, uuid)
values(1, 'chwapaw.menu.security', 99, null, '/chwapaw/ico/sys.png', null, uuid());

insert into image(id, path)
 value(1, 'img.png');
 
insert into users(id, person_id, username, password, email, image, groups_id, date, status, authentificationtime,
userkey, ip, port, created_by, created_date, uuid)
values(1, 1, 'ehis', '2712cd1967428c14d5ddaecd85063248', 'chwapaw@gmail.com', 1, 1, now(), 1, now(), uuid(), '192.168.0.101', '8081', 1, now(), uuid());
















































insert into locality(id, department, commune, section, locality, uuid)
values(1, 'Ouest', 'Croix-des-Bouquets', 'Santo', 'Santo 18', uuid());

insert into person(id, firstname, lastname, gender, phone, email, uuid)
values(1, 'Super', 'Admin', 'm', '509-37732-7650','enloja@gmail.com', uuid());

insert into school(id, name,contact,uuid)
values(1, 'Rezo Lekol Ayssyen', 1, uuid());

insert into groups(id, name, code, description, default_page, pass_exp_limit, uuid)
values(1, 'Super Administrateur', 'super', 'Le groupe qui peut tout faire', 'user/main.rla', null, uuid());

insert into groups(id, name, code, description, default_page, pass_exp_limit, uuid)
values(2, 'Groupe par défaut', 'default', 'Groupe des utilisateurs en attente', null, null, uuid());

insert into users(id, username, password, person_id, groups_id, status, school_id, language, created_by, created_date, activated_by, activated_date, uuid)
values(1, 'ehis', '2712cd1967428c14d5ddaecd85063248', 1, 1, 'Actif', 1, 'en', 1, now(), 1, now(), uuid()); --password e

insert into menu(id, code, position, url, path, parent_id, uuid)
values(1, 'rla.menu.security', 99, null, '/rla/ico/sys.png', null, uuid());

insert into menu(id, code, position, url, path, parent_id, uuid)
values(2, 'rla.menu.school', 79, null, '/rla/ico/school.png', null, uuid());

insert into menu(id, code, position, url, path, parent_id, uuid)
values(3, 'rla.menu.teacher', 89, null, '/rla/ico/teacher.png', null, uuid());

insert into menu(id, code, position, url, path, parent_id, uuid)
values(4, 'rla.menu.payment', 69, null, '/rla/ico/school.png', null, uuid());

insert into menu(id, code, position, url, path, parent_id, uuid)
values(5, 'rla.menu.student', 59, null, '/rla/ico/teacher.png', null, uuid());

insert into group_menu(groups_id, menu_id)
values(1, 1),(1,2);


