-- staff1という名前の一般ユーザーを利用する場合
-- rails_app_testに対するアクセス権限をstaffに付与
GRANT ALL ON `rails_app_test`.* TO 'staff'@'%';