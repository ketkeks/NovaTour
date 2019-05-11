REPLACE INTO `role` VALUE (1, 'ADMIN');
REPLACE INTO `role` VALUE (2, 'OPERATOR');
REPLACE INTO `tour`.`user` (`user_id`, `active`, `email`, `last_name`, `name`, `password`) VALUES ('1', '1', 'admin@admin.ru', 'Гончарова', 'Екатерина', '$2a$10$WBPq2E41lmeHTRQZedMrdeJX/NwLblVfC.xXT5gw7/5k3aeKl94Nu');
REPLACE INTO `tour`.`user_role` (`user_id`, `role_id`) VALUES ('1', '1');