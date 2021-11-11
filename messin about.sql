use carlyg;

# Carly, I think we should meet to discuss this, I think that there are misunderstandings that need to get cleared up ;-)
drop table if exists address, company, personal, phone, phone_type, pricing, product, shipping, state, title;

create table title(
    title_ID int NOT NULL auto_increment primary key,
    title varchar(255)
);

create table personal(
    name_ID int NOT NULL auto_increment primary key , # Add PRIMARY KEY AUTOINCREMENT
    first_name varchar(255),
    last_name varchar(255),
    title_ID int,
    foreign key (title_ID) references title(title_ID)
);

create table phone_type(
    phone_type_ID int auto_increment primary key, # Add PRIMARY KEY AUTOINCREMENT
    phone_type varchar(255)
);

create table phone(
    phone_ID int NOT NULL auto_increment primary key, # Add PRIMARY KEY AUTOINCREMENT
    phone_number varchar(255),
    phone_type_ID int,
    foreign key (phone_type_ID) references phone_type(phone_type_ID)
);

# This really belongs in the invoice table and the invoice items table respectively.

create table product(
    product_ID int NOT NULL auto_increment primary key, # Add PRIMARY KEY AUTOINCREMENT
    product_type varchar(255),
    product_weight int,
    product_quantity int,
    price int
);

create table pricing(
    price_ID int NOT NULL auto_increment primary key , # Add PRIMARY KEY AUTOINCREMENT
    price int,
    tax_rate varchar(255),
    foreign key (price) references product(product_ID)
    );

# Price should be here too!

# What about state_ID??

drop table if exists address;
create table address(
    address_ID int not null auto_increment primary key, # Add PRIMARY KEY AUTOINCREMENT
    street varchar(255),
    city varchar(255),
    state_ID varchar(255),
    postal_code varchar(255),
    foreign key (address_ID) references personal(name_ID)
);

create table state(
    state_ID int NOT NULL auto_increment primary key,
    state varchar(255),
    tax_rate varchar(255),
    taxable varchar(255),
    foreign key (state_ID) references address(address_ID)
);


create table shipping(
    shipping_ID int not null auto_increment primary key,
    shipping_company_ID INT,
    shipping_method varchar(255),
    ship_date_ID varchar(255),  # This belongs in the invoices table
    status int                 # This belongs in the invoices table

);

create table company(
    company_ID int not null auto_increment primary key, # Add PRIMARY KEY AUTOINCREMENT
    company_name_ID varchar(255)
# Add name_id
);

