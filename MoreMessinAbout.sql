select * from invoices;

create table personal(
    name_ID int NOT NULL ,
    first_name varchar(30),
    last_name varchar(30),
    title varchar(8),
    primary key (name_ID)
                  );

create table phone(
    phone_ID int NOT NULL ,
    phone_number char(12),
    phone_type varchar(30),
    primary key(phone_ID)
                  );
create table phone_type(
    phone_type_ID int,
    home_phone int,
    work_phone int,
    fax int,
    primary key (phone_type_ID)
);

create table pricing(
    price_ID int NOT NULL ,
    price int,
    tax_rate varchar(255),
    primary key (price_ID)
    );

create table product(
    product_ID int NOT NULL,
    product_type varchar(255),
    product_weight int,
    product_quantity int,
    primary key (product_ID)
                    );
create table address(
    address_ID int,
    street_ID varchar(255),
    city_ID varchar(255),
    postal_code varchar(255),
    primary key (postal_code)

);

create table shipping(
    shipping_company_ID varchar(255),
    ship_date_ID varchar(255),
    status int,
    primary key (shipping_company_ID)
);

create table company(
    company_ID int,
    company_name_ID varchar(255),
    primary key (company_ID)
);
create table state(
    state_ID int,
    taxable varchar(255),
    primary key (state_ID)
);

select * from invoices;

use carlyg;

set foreign_key_checks =0;

Drop table if exists company;
create table 'company' (
    'company_ID' int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'company' varchar(30),
    'title' varchar(8),
    'first_name' varchar(30),
    'last_name' varchar(30),
    'discount_rate' int,
    'invoice_ID' int unsigned,
    'taxable' char(1),
    'created_by' varchar(30))
engine =InnoDB
DEFAULT CHARACTER SET = utf8;

Drop table if exists address;
create table 'address'(
    'address_ID' int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    'company_ID' int unsigned NOT NULL,
    'street' varchar(30),
    'city' varchar(30),
    'state_ID' int unsigned NOT NULL,
    'postal_code' char(10)
)ENGINE =InnoDB
DEFAULT CHARACTER SET = utf8;

Alter table address ADD
    CONSTRAINT Company_FK
        foreign key ('company_ID')
        references company(company_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE;

ALTER TABLE address ADD
    CONSTRAINT State_FK
        foreign key ('state_ID')
        references address(state_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE;

#insert into names (name_ID, first_name, last_name)
 #   values(01, 'carly', 'grass'),

#insert into phone(phone_ID,phone_number, phone_type)
 #   values(01, 6035562232, 'home')
