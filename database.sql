drop database if exists verkkokauppa;
create database verkkokauppa;
use verkkokauppa;

create table category (
    id int primary key auto_increment,
    name varchar(50) not null
);

create table product (
    id int primary key auto_increment,
    name varchar(100) not null,
    price double (10,2) not null,
    image varchar(50),
    description char(255),
    category_id int not null,
    index category_id(category_id),
    foreign key (category_id) references category(id)
    on delete restrict
);

create table customer (
    id int primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    address varchar(50) not null,
    zip varchar(10) not null,
    city varchar(30) not null
);

create table `order` (
    id int primary key auto_increment,
    order_date timestamp default current_timestamp,
    customer_id int not null,
    index customer_id(customer_id),
    foreign key (customer_id) references customer(id)
    on delete restrict
);

create table order_row (
    order_id int not null,
    index order_id(order_id),
    foreign key (order_id) references `order`(id)
    on delete restrict,
    product_id int not null, 
    index product_id(product_id),
    foreign key (product_id) references product(id)
    on delete restrict
);

insert into category(name) values ('Huonekalut');
insert into category(name) values ('Valaisimet');
insert into category(name) values ('Sisustustavarat');

/* category_id 
huonekalut: 1
valaisimet: 2
sisustus: 3 */


/* insert into product (name, price, image, category_id) values ('Pöytä', 100, 'placeholder.png', 1);
insert into product (name, price, image, category_id) values ('Tuoli', 50, 'placeholder.png', 1);

insert into product (name, price, image, category_id) values ('Pöytälamppu', 20, 'placeholder.png', 2);
insert into product (name, price, image, category_id) values ('Kattolamppu', 30, 'placeholder.png', 2);

insert into product (name, price, image, category_id) values ('Tyynynpäällinen', 15, 'placeholder.png', 3);
insert into product (name, price, image, category_id) values ('Peili', 40, 'placeholder.png', 3); */

/* Jos ootte jo kertaalleen lisännyt tän VERKKOKAUPPA-tietokannan, lisätkää mysql lause, j
    oka lisää product-tauluun tiedot tuotteista.

    ALTER TABLE PRODUCT
    ADD description CHAR(255)
*/


/* Oikeat tuottteet ja niiden lisäyslauseet */

insert into product (name, price, image, category_id, description) values ('Cutie-cup kahvikuppi', 14.95, 'cutie-cup.jpg', 3, 'Kahvikuppi sekä lautanen. Kahvikupin koko 3,5dl.');
insert into product (name, price, image, category_id, description) values ('Dreamy-yöpöytä', 85.50, 'dreamy.jpg', 1, 'Täydestä mangopuusta valmistettu yöpöytä on kauniisti viimeistelty käsityönä. Yöpöydässä vetolaatikko. Helppo koota. Mitat 43x30x58 cm.');
insert into product (name, price, image, category_id, description) values ('Hang-puunaulakko ', 32.95, 'hang-naulakko.jpg', 3, 'Käsityönä bambusta hiottu naulakko. Seitsemällä ripustuskoukulla. Kiinnitys ruuveilla, jotka tulevat pakkauksessa mukana. Naulakon pituus on 30 cm.');
insert into product (name, price, image, category_id,description) values ('Sandy-maljakot 2 kpl', 37.95, 'sandy-maljakko.jpg', 3, 'Kauniit savesta käsityönä valmistetut maljakot.');
insert into product (name, price, image, category_id, description) values ('Cutie-cup kahvikuppi', 14.95, 'cutie-cup.jpg', 3, 'Kahvikuppi sekä lautanen. Kahvikupin koko 3,5dl.');
insert into product (name, price, image, category_id, description) values ('Hug-sohva', 560, 'hug-sohva.jpg', 1, 'Kankaan materiaali polyesteri ja puuvilla. Koko: K: 85 cm, L: 294 cm, käsinojan leveys: 22 cm, istuinkorkeus: 43 cm, käsinojan korkeus: 42 cm, istuinsyvyys: 53 cm, runko valmistettu vanerista ja massiivipuusta.');
insert into product (name, price, image, category_id, description) values ('Midnight-yöpöytä', 149.50, 'midnight-yopoyta.jpg', 1, 'Käsityönä punottu yöpöytä, joka on valmistettu luonnonmateriaalista bambusta. Mitat 40 x 40 cm.');
insert into product (name, price, image, category_id, description) values ('Kristina-lasimaljakko', 45.50, 'kristina-maljakko.jpg', 3, 'Lasimaljakko kauniilla muotoilulla.');
insert into product (name, price, image, category_id, description) values ('Balloons-peili', 70.50, 'balloons-peili.jpg', 3, 'Uniikilla muotoilulla seetripuusta valmistettu sisustuspeili.');
insert into product (name, price, image, category_id, description) values ('Snow-yöpöytä', 169.00, 'snow-yopoyta.jpg', 1, 'Kauniin muotoilun omaava yöpöytä, joka on valmistettu seetripuusta ja jalat kestävästä metallista. Mitat 45 x 45 cm, korkeus 56 cm.');
insert into product (name, price, image, category_id, description) values ('Stripe-kahvimuki', 19.50, 'stripe-muki.jpg', 3, 'Kauniin muotoilun omaava iso kahvimuki.');
insert into product (name, price, image, category_id, description) values ('Arizona-kaktus ja ruukku', 7.99, 'arizona-kaktus.jpg', 3, 'Minikaktus sekä pieni ruukku. Ruukun korkeus 6 cm.');
insert into product (name, price, image, category_id, description) values ('Athena-koristepatsas', 44.99, 'athena-patsas.jpg', 3, 'Athena-koristepatsas on saanut inpiraationsa kreikkalaisesta mytologiasta. Korkeus 40 cm, leveys 30 cm ja pituus 25 cm. Valmistettu polystonesta. Puhdistus nihkeällä liinalla. ');
insert into product (name, price, image, category_id, description) values ('Double-vaasi', 24.50, 'double-maljakko.jpg', 3, 'Keraaminen Double-vaasi. Korkeus 20 cm, halkaisija 12 cm.');

insert into product (name, price, image, category_id, description) values ('Locker-senkki', 399.00, 'locker-senkki.jpg', 1, 'Massiivipuusta valmistettu Locker-senkki jossa kahdeksan lokeroa. Korkeus 80 cm, leveys 145 cm ja syvyys 40 cm. Lokerikkojen mitat 35 x 38 cm.');
insert into product (name, price, image, category_id, description) values ('Round-peili', 80.00, 'round-peili.jpg', 3, 'Punotusta nauhasta roikkuva Round-peili. Halkaisija 60 cm.');
insert into product (name, price, image, category_id, description) values ('Tangerine-lakanasetti', 88.95, 'tangerine-lakanat.jpg', 3, 'Pellavasta valmistetut Tangerine-lakanat. Pakkauksessa yksi pussilakana 240x220cm, sekä kaksi tyynyliinaa 50x60cm. Suosittelemme pesua 60 asteessa sekä kuivausta kuivausrummussa keskilämmöllä.' );
insert into product (name, price, image, category_id, description) values ('Zara-kori', 39.50, 'zara-kori.jpg', 3, 'Meriheinästä valmistettu kori, jossa kahvat. Halkaisija 40 cm, korkeus 42 cm.');
insert into product (name, price, image, category_id, description) values ('Block-lipasto', 549.95, 'block-lipasto.jpg', 1, 'Skandinaavista muotoilua huokuva jykevä massiivipuinen lipasto kuudella vetolaatikolla. Leveys 153cm, korkeus 73cm, syvyys 40cm.');
insert into product (name, price, image, category_id, description) values ('Bamboo-tikkaat', 115.00, 'bamboo-tikkaat.jpg', 3, 'Kierrätyspuusta valmistetut kauniit sisustustikkaat.');

insert into product (name, price, image, category_id, description) values ('Copper-lattialamppu', 289.95, 'copper-lattialamppu.jpg', 2, 'Rouhea teollisuus-henkinen lattiavalaisin. Korkeus 150 cm.');
insert into product (name, price, image, category_id, description) values ('Gloomy-riippuvalaisin', 185.00, 'gloomy-kattolamppu.jpg', 2, 'Klassinen 50-lukua henkivä riippuvalaisin. Runko metallia, kupu lasia. Halkaisija 42 cm.');
insert into product (name, price, image, category_id, description) values ('Modern-riippuvalaisin', 159.00, 'modern-kattolamppu.jpg', 2, 'Siro ja nimensä mukainen moderni riippuvalaisin, joka sopii tilaan katseenvangitsijaksi kaikessa yksinkertaisuudessaan. Halkaisija 28 cm.');


/* Uudet lisäykset tietokantalauseisiin 
insert into product (name, price, image, category_id, description) values ();
insert into product (name, price, image, category_id, description) values ('Modern-riippuvalaisin', 159.00, 'modern-kattolamppu.jpg', 2, '');
*/ 


insert into product (name, price, image, category_id, description) values ('Modern-riippuvalaisin', 159.95, 'modern-kattolamppu.jpg', 2, 'Siro ja nimensä mukainen moderni riippuvalaisin, joka sopii tilaan katseenvangitsijaksi kaikessa yksinkertaisuudessaan. Halkaisija 28 cm.');
insert into product (name, price, image, category_id, description) values ('Night-pöytävalaisin', 209.95, 'night-yolamppu.jpg', 2, 'Pyöreä pöytävalaisin jonka vaalea, mattainen lasivarjostin luo pehmeän ja harmonisen valon. Halkaisija 30 cm.');
insert into product (name, price, image, category_id, description) values ('Nude-pöytävalaisin', 159.00, 'nude-poytalamppu.jpg', 2, 'Boho-henkinen pöytävalaisin, jonka varjostin rouheasta säkkikankaasta. Tuo lämpöä ja palan Balia sisustukseen. Korkeus 40 cm, varjostimen halkaisija 28 cm.');
insert into product (name, price, image, category_id, description) values ('Simple-lattialamppu', 289.00, 'simple-lattialamppu.jpg', 2, 'Tyylikäs tripod-lattiavalaisin, säädettävillä puisilla jaloilla, kankaisella varjostimella. Säädettävä korkeus max. 160 cm, varjostimen halkaisija 55 cm.');

insert into product (name, price, image, category_id, description) values ('Oreo-vaasi', 62.00, 'oreo-maljakko.jpg', 3, 'Pyöreä kivikeraaminen maljakko, jossa keskellä reikä. Korkeus 21 cm, leveys 22.5 cm');
insert into product (name, price, image, category_id, description) values ('Jungle-muki', 14.50, 'jungle-muki.jpg', 3, 'Posliinimuki, jossa käsin maalattu graafinen kuviointi.');
insert into product (name, price, image, category_id, description) values ('Stitch-tyynynpäällinen', 48.00, 'stitch-tyyny.jpg', 3, 'Tyynynpäällinen pestyä pellavaa, reunoissa koristetikkaukset.');
insert into product (name, price, image, category_id, description) values ('Trick-pöytävalaisin', 159.00, 'trick-valaisin.jpg', 2, 'Kuparinen pöytävalaisin, harjattua metallia. Korkeus 48 cm.');

