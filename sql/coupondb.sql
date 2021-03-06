DROP SCHEMA IF EXISTS coupondb;

CREATE SCHEMA coupondb CHARACTER SET utf8 COLLATE utf8_general_ci;

create table coupondb.cp_coupon
(
	id char(36) not null
		primary key,
	post_time datetime default CURRENT_TIMESTAMP not null,
	put_time datetime default CURRENT_TIMESTAMP not null,
	name varchar(32) default '' not null,
	active tinyint(1) default '1' not null,
	`desc` varchar(256) default '' not null,
	level int default '0' not null,
	owner_id char(36) default '00000000-0000-0000-0000-000000000000' not null,
	shared tinyint(1) default '0' not null,
	activity_id char(36) not null,
	template_id char(36) not null,
	pack_id char(36) not null,
	batch_id char(36) not null,
	class int default '0' not null,
	kind int default '0' not null,
	product_id varchar(36) default '' not null,
	min_amount decimal(10,2) default '0.00' not null,
	offer_amount decimal(10,2) default '0.00' not null,
	used_count int default '0' not null,
	used_time datetime default CURRENT_TIMESTAMP not null,
	dead_time datetime default CURRENT_TIMESTAMP not null,
	constraint cp_coupon_id_uindex
		unique (id)
)
;

create index cp_coupon_active_dead_time_index
	on coupondb.cp_coupon (active, dead_time)
;

create index cp_coupon_activity_id_index
	on coupondb.cp_coupon (activity_id)
;

create index cp_coupon_class_kind_index
	on coupondb.cp_coupon (class, kind)
;

create index cp_coupon_template_id_index
	on coupondb.cp_coupon (template_id)
;

create index cp_coupon_batch_id_index
	on coupondb.cp_coupon (batch_id)
;

create index cp_coupon_pack_id_index
	on coupondb.cp_coupon (pack_id)
;

create index cp_coupon_owner_id_index
	on coupondb.cp_coupon (owner_id)
;

create index cp_coupon_shared_index
	on coupondb.cp_coupon (shared)
;

create table coupondb.cp_coupon_activity
(
	id char(36) not null
		primary key,
	post_time datetime default CURRENT_TIMESTAMP not null,
	put_time datetime default CURRENT_TIMESTAMP not null,
	name varchar(32) default '' not null,
	active tinyint(1) default '1' not null,
	`desc` varchar(256) default '' not null,
	level int default '0' not null,
	owner_id char(36) default '00000000-0000-0000-0000-000000000000' not null,
	shared tinyint(1) default '0' not null,
	url varchar(256) default '' not null,
	class int default '0' not null,
	kind int default '0' not null,
	coupon_limit int default '0' not null,
	dead_time datetime default CURRENT_TIMESTAMP not null,
	constraint cp_coupon_activity_id_uindex
		unique (id)
)
;

create index cp_coupon_activity_active_dead_time_index
	on coupondb.cp_coupon_activity (active, dead_time)
;

create index cp_coupon_activity_class_kind_index
	on coupondb.cp_coupon_activity (class, kind)
;

create index cp_coupon_activity_owner_id_index
	on coupondb.cp_coupon_activity (owner_id)
;

create index cp_coupon_activity_shared_index
	on coupondb.cp_coupon_activity (shared)
;

create table coupondb.cp_coupon_batch
(
	id char(36) not null
		primary key,
	post_time datetime default CURRENT_TIMESTAMP not null,
	put_time datetime default CURRENT_TIMESTAMP not null,
	owner_id char(36) not null,
	activity_id char(36) not null,
	constraint cp_coupon_batch_id_uindex
		unique (id)
)
;

create index cp_coupon_batch_activity_id_index
	on coupondb.cp_coupon_batch (activity_id)
;

create index cp_coupon_batch_owner_id_index
	on coupondb.cp_coupon_batch (owner_id)
;

create table coupondb.cp_coupon_pack
(
	id char(36) not null
		primary key,
	post_time datetime default CURRENT_TIMESTAMP not null,
	put_time datetime default CURRENT_TIMESTAMP not null,
	name varchar(32) default '' not null,
	active tinyint(1) default '1' not null,
	`desc` varchar(256) default '' not null,
	level int default '0' not null,
	owner_id char(36) default '00000000-0000-0000-0000-000000000000' not null,
	shared tinyint(1) default '0' not null,
	activity_id char(36) not null,
	template_id char(36) not null,
	coupon_size int default '0' not null,
	coupon_count int default '0' not null,
	dead_day int default '0' not null,
	constraint cp_coupon_pack_id_uindex
		unique (id)
)
;

create index cp_coupon_pack_active_index
	on coupondb.cp_coupon_pack (active)
;

create index cp_coupon_pack_activity_id_index
	on coupondb.cp_coupon_pack (activity_id)
;

create index cp_coupon_pack_template_id_index
	on coupondb.cp_coupon_pack (template_id)
;

create index cp_coupon_pack_owner_id_index
	on coupondb.cp_coupon_pack (owner_id)
;

create index cp_coupon_pack_shared_index
	on coupondb.cp_coupon_pack (shared)
;

create table coupondb.cp_coupon_template
(
	id char(36) not null
		primary key,
	post_time datetime default CURRENT_TIMESTAMP not null,
	put_time datetime default CURRENT_TIMESTAMP not null,
	name varchar(32) default '' not null,
	active tinyint(1) default '1' not null,
	`desc` varchar(256) default '' not null,
	level int default '0' not null,
	owner_id char(36) default '00000000-0000-0000-0000-000000000000' not null,
	shared tinyint(1) default '0' not null,
	class int default '0' not null,
	kind int default '0' not null,
	product_id varchar(36) default '' not null,
	min_amount decimal(10,2) default '0.00' not null,
	offer_amount decimal(10,2) default '0.00' not null,
	constraint cp_coupon_template_id_uindex
		unique (id)
)
;

create index cp_coupon_template_active_index
	on coupondb.cp_coupon_template (active)
;

create index cp_coupon_template_class_kind_index
	on coupondb.cp_coupon_template (class, kind)
;

create index cp_coupon_template_product_id_index
	on coupondb.cp_coupon_template (product_id)
;

create index cp_coupon_template_owner_id_index
	on coupondb.cp_coupon_template (owner_id)
;

create index cp_coupon_template_shared_index
	on coupondb.cp_coupon_template (shared)
;
