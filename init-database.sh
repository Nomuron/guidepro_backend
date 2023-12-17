#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;

    CREATE TABLE "user"(
        id SERIAL NOT NULL PRIMARY KEY,
        email VARCHAR(120) NOT NULL UNIQUE,
        password text NOT NULL,
        name VARCHAR(60) NOT NULL,
        surname VARCHAR(90) NOT NULL,
        user_type VARCHAR(20) NOT NULL,
        phone_number VARCHAR(12) NOT NULL,
        image_id text,
        is_removed BOOLEAN NOT NULL
    );

    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (1, 'asdf', 'Kacper', 'Nowak', 'kacper.nowak@gmail.com', 'GUIDE', '+48123456789', 'abcd', '1');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (2, 'asdf', 'Oliwia', 'Kowalska', 'oliwia.kowalska@gmail.com', 'GUIDE', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (3, 'asdf', 'Jakub', 'Wiśniewski', 'jakub.wiśniewski@wp.pl', 'GUIDE', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (4, 'asdf', 'Zuzanna', 'Dąbrowska', 'zuzanna.dąbrowska@wp.pl', 'GUIDE', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (5, 'asdf', 'Michał', 'Lewandowski', 'michał.lewandowski@wp.pl', 'GUIDE', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (6, 'asdf', 'Julia', 'Wójcik', 'julia.wójcik@wp.pl', 'GUIDE', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (7, 'asdf', 'Szymon', 'Kamiński', 'szymon.kamiński@gmail.com', 'TOURIST', '+48123456789', 'abcd', '1');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (8, 'asdf', 'Amelia', 'Kowalczyk', 'amelia.kowalczyk@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (9, 'asdf', 'Mateusz', 'Zieliński', 'mateusz.zieliński@onet.pl', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (10, 'asdf', 'Hanna', 'Szymańska', 'hanna.szymańska@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (11, 'asdf', 'Adam', 'Woźniak', 'adam.woźniak@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (12, 'asdf', 'Natalia', 'Kozłowska', 'natalia.kozłowska@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (13, 'asdf', 'Wojciech', 'Jankowski', 'wojciech.jankowski@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (14, 'asdf', 'Lena', 'Mazur', 'lena.mazur@wp.pl', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (15, 'asdf', 'Piotr', 'Krawczyk', 'piotr.krawczyk@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (16, 'asdf', 'Alicja', 'Piotrowska', 'alicja.piotrowska@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (17, 'asdf', 'Filip Wiktoria', 'Grabowska', 'filip wiktoria.grabowska@grabowska.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (18, 'asdf', 'Marcel', 'Nowakowski', 'marcel.nowakowski@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (19, 'asdf', 'Martyna', 'Pawlak', 'martyna.pawlak@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (20, 'asdf', 'Baltazar', 'Michalski', 'baltazar.michalski@gmail.com', 'TOURIST', '+48123456789', 'abcd', '0');
    INSERT INTO "user"(id, password, name, surname, email, user_type, phone_number, image_id, is_removed) VALUES (21, 'asdf', 'Admin', 'Adminowski', 'admin.adminowski@gmail.com', 'MODERATOR', '+48123456789', 'abcd', '0');

    CREATE TABLE language(
        id SERIAL NOT NULL PRIMARY KEY,
        language VARCHAR(2) NOT NULL UNIQUE
    );

    INSERT INTO language(id, language) VALUES (1, 'EN');
    INSERT INTO language(id, language) VALUES (2, 'PL');
    INSERT INTO language(id, language) VALUES (3, 'DE');
    INSERT INTO language(id, language) VALUES (4, 'NL');
    INSERT INTO language(id, language) VALUES (5, 'IT');
    INSERT INTO language(id, language) VALUES (6, 'FR');

    CREATE TABLE user_guide(
        user_guide_id integer REFERENCES "user"(id) UNIQUE,
        guide_type VARCHAR(50) NOT NULL,
        has_certificate BOOLEAN NOT NULL,
        age integer NOT NULL,
        gender CHAR(1) NOT NULL,
        about_me text NOT NULL,
        interests text NOT NULL
    );

    INSERT INTO user_guide(user_guide_id, guide_type, has_certificate, age, gender, about_me, interests) VALUES (1, 'MIEJSKI', '1', 20, 'm', 'Z pasją odkrywam zakamarki świata, prowadząc Cię przez nieznane szlaki. Wędrowanie ze mną to nie tylko podróż, to spotkanie z historią, kulturą i niepowtarzalnymi doświadczeniami.', 'rolki, skateboard, spacery, zachody słońca');
    INSERT INTO user_guide(user_guide_id, guide_type, has_certificate, age, gender, about_me, interests) VALUES (2, 'MIEJSKI', '0', 30, 'f', 'Jako twój przewodnik, oferuję więcej niż tylko informacje. Zapraszam Cię na podróż, gdzie każdy krok to spotkanie z fascynującą historią, malowniczymi krajobrazami i autentycznymi smakami miejscowych kulinariów.', 'podróże do ryzykownych miejsc, gra w pasjansa, historia');
    INSERT INTO user_guide(user_guide_id, guide_type, has_certificate, age, gender, about_me, interests) VALUES (3, 'GÓRSKI', '1', 40, 'm', 'Moje opowieści odkrywają przed Tobą świat z zupełnie nowej perspektywy. Jako przewodnik staram się nie tylko przekazać informacje, ale również wprowadzić Cię w klimat każdego miejsca, które razem odkrywamy.', 'restauracje kuchni azjatyckiej, jazda na rowerze, box');
    INSERT INTO user_guide(user_guide_id, guide_type, has_certificate, age, gender, about_me, interests) VALUES (4, 'MUZEALNY', '1', 40, 'f', 'Podążając moimi śladami, zanurzysz się w niepowtarzalnych historiach, tajemniczych zakątkach i lokalnych zwyczajach. Razem z Tobą tworzę podróż pełną niezapomnianych chwil.', 'historia, książki, spacery, architektura');
    INSERT INTO user_guide(user_guide_id, guide_type, has_certificate, age, gender, about_me, interests) VALUES (5, 'TERENOWY', '1', 50, 'm', 'Jako pasjonat podróży i przewodnik, oferuję nie tylko zwiedzanie miejsc, ale autentyczne doświadczenia. Każde spotkanie ze mną to możliwość zgłębienia kultury, historii i smaków odległych krain.', 'bieg długodystansowy, natura, tenis, squash');
    INSERT INTO user_guide(user_guide_id, guide_type, has_certificate, age, gender, about_me, interests) VALUES (6, 'MIEJSKI', '0', 50, 'n', 'W moim towarzystwie podróż staje się nie tylko widokiem, ale uczuciem. Przewodzę Cię z entuzjazmem przez zabytkowe uliczki, malownicze krajobrazy i unikalne doświadczenia, zawsze z myślą o Twojej wyjątkowej podróży.', 'książki, gra na gitarze, siatkówka');

    CREATE TABLE user_language(
        id SERIAL NOT NULL PRIMARY KEY,
        user_id integer REFERENCES "user"(id),
        language_id integer REFERENCES language(id)
    );

    INSERT INTO user_language(id, user_id, language_id) VALUES (1, 1, 1);
    INSERT INTO user_language(id, user_id, language_id) VALUES (2, 1, 2);
    INSERT INTO user_language(id, user_id, language_id) VALUES (3, 1, 3);
    INSERT INTO user_language(id, user_id, language_id) VALUES (4, 1, 4);
    INSERT INTO user_language(id, user_id, language_id) VALUES (5, 1, 5);
    INSERT INTO user_language(id, user_id, language_id) VALUES (6, 1, 6);
    INSERT INTO user_language(id, user_id, language_id) VALUES (7, 2, 1);
    INSERT INTO user_language(id, user_id, language_id) VALUES (8, 3, 2);
    INSERT INTO user_language(id, user_id, language_id) VALUES (9, 4, 3);
    INSERT INTO user_language(id, user_id, language_id) VALUES (10, 4, 4);
    INSERT INTO user_language(id, user_id, language_id) VALUES (11, 4, 5);
    INSERT INTO user_language(id, user_id, language_id) VALUES (12, 5, 1);
    INSERT INTO user_language(id, user_id, language_id) VALUES (13, 5, 2);
    INSERT INTO user_language(id, user_id, language_id) VALUES (14, 5, 3);
    INSERT INTO user_language(id, user_id, language_id) VALUES (15, 6, 1);
    INSERT INTO user_language(id, user_id, language_id) VALUES (16, 6, 4);
    INSERT INTO user_language(id, user_id, language_id) VALUES (17, 6, 5);
    INSERT INTO user_language(id, user_id, language_id) VALUES (18, 6, 6);

    CREATE TABLE category(
        id SERIAL NOT NULL PRIMARY KEY,
        name VARCHAR(25) NOT NULL
    );

    INSERT INTO category(id, name) VALUES (1, 'HISTORIA');
    INSERT INTO category(id, name) VALUES (2, 'NATURA');
    INSERT INTO category(id, name) VALUES (3, 'KULTURA_I_SZTUKA');
    INSERT INTO category(id, name) VALUES (4, 'NAUKA_I_TECHNOLOGIA');
    INSERT INTO category(id, name) VALUES (5, 'KULINARIA');
    INSERT INTO category(id, name) VALUES (6, 'SPORT');
    INSERT INTO category(id, name) VALUES (7, 'ROZRYWKA');
    INSERT INTO category(id, name) VALUES (8, 'MIASTO');
    INSERT INTO category(id, name) VALUES (9, 'ROWER');
    INSERT INTO category(id, name) VALUES (10, 'WEDROWKA_GORSKA');

    CREATE TABLE image(
        id SERIAL NOT NULL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        url text NOT NULL
    );

    INSERT INTO image(id, name, url) VALUES (1, 'Zdjęcie wycieczki 1', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (2, 'Zdjęcie wycieczki 2', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (3, 'Zdjęcie wycieczki 3', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (4, 'Zdjęcie wycieczki 4', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (5, 'Zdjęcie wycieczki 5', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (6, 'Zdjęcie wycieczki 6', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (7, 'Zdjęcie wycieczki 7', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (8, 'Zdjęcie wycieczki 8', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (9, 'Zdjęcie wycieczki 9', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (10, 'Zdjęcie wycieczki 10', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (11, 'Zdjęcie wycieczki 11', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (12, 'Zdjęcie wycieczki 12', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (13, 'Zdjęcie wycieczki 13', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (14, 'Zdjęcie wycieczki 14', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (15, 'Zdjęcie wycieczki 15', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (16, 'Zdjęcie wycieczki 16', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (17, 'Zdjęcie wycieczki 17', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (18, 'Zdjęcie wycieczki 18', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (19, 'Zdjęcie wycieczki 19', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');
    INSERT INTO image(id, name, url) VALUES (20, 'Zdjęcie wycieczki 20', 'https://i.pinimg.com/236x/38/86/37/388637679f2127ee5a4114c78224c282.jpg');

    CREATE TABLE trip(
        id SERIAL NOT NULL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        description_short VARCHAR(400) NOT NULL,
        user_guide_id integer REFERENCES user_guide(user_guide_id) NOT NULL,
        duration SMALLINT NOT NULL,
        language_id integer REFERENCES language(id) NOT NULL,
        price NUMERIC(8,2) NOT NULL,
        additional_fee text NOT NULL,
        max_person_amount SMALLINT NOT NULL,
        min_person_amount SMALLINT NOT NULL,
        trip_town VARCHAR(50) NOT NULL,
        meeting_point_address text,
        geographical_coordinates POINT,
        remember_about text,
        additional_info text,
        is_removed BOOLEAN NOT NULL,
        length SMALLINT NOT NULL
    );

    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (1, 'Edukacyjny spacer na plaży', 'Odkryj fascynujący świat przybrzeżnej fauny i flory podczas relaksującego spaceru po pięknej plaży. Poznaj tajemnice morza i zanurz się w edukacyjnej podróży wzdłuż wybrzeża.', 1, 2, 1, 10, 'brak', 20, 10, 'Gdańsk', NULL, POINT(54.407909, 18.638372), 'lekkie obuwie do spaceru po plaży, ciepłego okrycia wierzchniego w razie wiatru, okulary przeciwsłoneczne', 'dla wszystkich grup wiekowych', '0', 10);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (2, 'Szlakiem gdańskich kamienic', 'Przenieś się w czasie, zwiedzając urokliwe gdańskie kamienice. Poznaj historię miasta, ukrytą w malowniczych zaułkach i kolorowych fasadach, podczas tej wyjątkowej wycieczki.', 2, 3, 2, 20, 'bilet wstępu do zabytkowej kamienicy: 5 zł/os', 25, 15, 'Gdańsk', NULL, POINT(54.351151, 18.659428), NULL, 'dostosowane do różnych grup wiekowych', '0', 10);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (3, 'Spływ kajakowy o średnim poziomie trudności', 'Odkryj magiczną równowagę przyrody, podczas spływu kajakowego malowniczymi szlakami rzek. Czekają na Ciebie przygoda, emocje i niezapomniane krajobrazy.', 5, 5, 1, 30, 'ubezpieczenie: 30zł/os, dodatkowy kapok: 10 zł/os', 10, 8, 'Wdzydze', 'Stolema 1, 83-406 Wdzydze', NULL, 'nieprzemakalne ubrania, kapelusz lub czapka, pokrowce nieprzemakalne na kluczyki/telefon/itp.', 'dla średniozaawansowanych, idealna dla miłośników natury i aktywnego wypoczynku', '0', 20);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (4, 'Muzeum II Wojny Światowej okiem pasjonaty historii', 'Przeżyj intensywne chwile historii, zwiedzając Muzeum II Wojny Światowej w Gdańsku. Zanurz się w czasach konfliktu, odkrywając niezwykłe artefakty i opowieści.', 4, 3, 3, 25.99, 'brak', 12, 20, 'Gdańsk', 'plac Władysława Bartoszewskiego 1, 80-862 Gdańsk', NULL, NULL, 'dla entuzjastów historii, z uwzględnieniem różnych grup wiekowych', '1', 0);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (5, 'Spacer wzdłuż Motławy', 'Podążaj brzegiem rzeki Motławy, czerpiąc radość z urokliwego krajobrazu i klimatu miasta. Odkrywaj ukryte zakątki, które sprawią, że Twój spacer stanie się niezapomnianym przeżyciem.', 2, 4, 4, 15, 'brak', 15, 10, 'Gdańsk', NULL, POINT(54.346212, 18.654430), NULL, 'spacer przyjazny dla rodzin, dostępny dla wózków inwalidzkich, zapewniający relaks przy brzegu rzeki', '0', 5);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (6, 'Rejs statkiem po zatoce Gdańskiej', 'Podnieś kotwicę i wyrusz w morską przygodę, podziwiając Gdańsk z perspektywy zatoki. Rejs statkiem to nie tylko wspaniała sceneria, ale także możliwość odkrycia fascynującej historii portu.', 2, 4, 1, 50, 'jedzenie na statku we własnym zakresie', 30, 20, 'Gdańsk', NULL, POINT(54.347629, 18.655704), 'płaszcz przeciwdeszczowy, lornetka', 'dostępny dla wszystkich, również dla osób z ograniczoną mobilnością, z doskonałą opieką załogi', '0', 0);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (7, 'Górska przygoda w Tatrach', 'Wyrusz na górską wyprawę, podziwiając niezrównane piękno Tatr. Dla miłośników przyrody, emocji i malowniczych szlaków – ta wycieczka to prawdziwe wyzwanie.', 3, 8, 1, 38, 'jedzenie we własnym zakresie, możliwość wykupienia prowiantu na cały dzień za 50 zł/os: 2 kanapki, napój, słodka przekąska, ciepła zupa, ciepły posiłek w postaci obiadokolacji w schronisku', 12, 8, 'Zakopane', 'Nowotarska 10c/44, 34-500 Zakopane', NULL, 'obuwie do chodzenia po górach, płaszcz przeciwdeszczowy', 'dla pasjonatów przyrody, zalecana dla osób w dobrej kondycji fizycznej', '0', 26);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (8, 'Wycieczka rowerowa w Trójmiejskim Parku Krajobrazowym', 'Odkrywaj uroki przyrody, pedałując po malowniczych trasach Trójmiejskiego Parku Krajobrazowego. Rowerowa wyprawa to idealny sposób na zdrową aktywność i kontemplację natury.', 5, 5, 1, 10, 'brak', 12, 5, 'Gdańsk', 'Rakoczego 7, 80-288 Gdańsk', NULL, NULL, 'dla amatorów aktywności fizycznej, trasy dostosowane do różnych poziomów trudności', '0', 22);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (9, 'Spacer żółtym szlakiem w Trójmiejskim Parku Krajobrazowym', 'Podążaj żółtym szlakiem, odkrywając urokliwe zakątki przyrody i czerpiąc radość z obcowania z otaczającym światem.', 5, 3, 5, 41, 'brak', 14, 10, 'Gdańsk', 'Rakoczego 7, 80-288 Gdańsk', NULL, NULL, 'dla rodzin z dziećmi', '0', 10);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (10, 'Poznaj historię Sopotu', 'Zwiedzaj urokliwe miejsca Sopotu, poznając fascynującą historię tego nadmorskiego kurortu. Spaceruj po słynnym molo i odkrywaj tajemnice tej malowniczej miejscowości.', 2, 3, 6, 50.5, 'brak', 15, 10, 'Sopot', 'Plac Zdrojowy 2, 81-723 Sopot', NULL, NULL, 'dla różnych grup wiekowych, z uwzględnieniem ciekawostek dla najmłodszych', '0', 4);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (11, 'Oprowadzanie po muzeum Emigracji w Gdyni', 'Przeniknij się atmosferą historii emigracji, uczestnicząc w oprowadzaniu po Muzeum Emigracji w Gdyni. Poznaj losy ludzi, którzy odważyli się na życiową podróż.', 4, 4, 2, 20, 'opłata za wstęp do muzeum zgodnie z aktualnym cennikiem muzeum', 8, 3, 'Gdynia', NULL, POINT(54.532634, 18.546115), NULL, 'dla grup szkolnych, z uwzględnieniem edukacyjnych atrakcji', '0', 2);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (12, 'Wycieczka piesza do Morskiego Oka', 'Pokonaj szlak w kierunku jednego z najpiękniejszych jezior w Polsce – Morskiego Oka. Piesza wyprawa to nie tylko trud, ale także możliwość zanurzenia się w magicznym krajobrazie Tatr.', 3, 11, 1, 58, 'ciepły posiłek: 60zł/os.', 10, 20, 'Zakopane', 'Hr. Władysława Zamoyskiego 18, 34-500 Zakopane', NULL, 'obuwie do chodzenia po górach, płaszcz przeciwdeszczowy', 'dla aktywnych, zalecana dla doświadczonych turystów', '0', 25);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (13, 'Gdańskie Tramwaje, historia, dawne linie', 'Przeżyj nostalgię podróżując historycznymi trasami tramwajowymi Gdańska. Odkryj tajemnice dawnych linii tramwajowych, przechodząc przez miejsca pełne historii.', 6, 2, 1, 10.99, 'brak', 15, 5, 'Gdańsk', NULL, POINT(54.377074, 18.611429), NULL, 'w cenie przejazd tramwajem do śródmieścia, dzieci od lat 4', '0', 3);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (14, 'Edukacyjne spotkanie ornitologiczne dla dzieci', 'Wprowadź najmłodszych w fascynujący świat ptaków, organizując edukacyjne spotkanie ornitologiczne. Dla dzieci to szansa na naukę i zabawę w jednym.', 6, 2, 1, 15, 'brak', 10, 4, 'Gdańsk', 'Gabriela Narutowicza 11/12, 80-233 Gdańsk', NULL, NULL, 'dzieci od lat 4, rozwija zainteresowania przyrodnicze', '0', 0);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (15, 'Morze pełne tajemnic, edukacyjna wycieczka o zwierzętach występujących w Bałtyku', 'Odkryj bogactwo morskiej fauny i flory Bałtyku, uczestnicząc w edukacyjnej wycieczce. Poznaj tajemnice morza, zanurzając się w fascynującą przygodę.', 2, 3, 2, 80, 'brak', 12, 5, 'Hel', 'Stacja Morska Instytutu Oceanografii Uniwersytetu Gdańskiego, Morska 2, 84-150 Hel', NULL, NULL, 'w cenie wejście do fokarium, dzieci poniżej 3 r.ż. nie są wliczane do ogólnej ilości osób na wycieczce i wchodzą bezpłatnie, przyjazna dla dzieci, z uwzględnieniem edukacyjnych atrakcji', '0', 0);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (16, 'Piesza wycieczka w tematyce historii Kaszub', 'Przenieś się w czasie, odkrywając bogatą historię Kaszub. Piesza wycieczka poświęcona tradycjom i kulturze regionu to prawdziwe zanurzenie się w lokalnej historii.', 5, 6, 1, 20, 'brak', 15, 7, 'Kartuzy', 'Klasztorna 18, 83-300 Kartuzy', NULL, NULL, 'dla miłośników historii regionalnej, dostosowana do różnych grup wiekowych', '0', 6);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (17, 'Kulinarna podróż po tradycyjnych potrawach Kaszub', 'Smakuj tradycyjne potrawy Kaszub, uczestnicząc w kulinarnym szlaku. Degustuj regionalne smakołyki i poznawaj kulinarne tajemnice regionu.', 5, 4, 1, 100, 'brak', 10, 4, 'Kościerzyna', 'Klasztorna 38, 83-400 Kościerzyna', NULL, NULL, 'w cenie degustacja tradycyjnych potraw Kaszubskich, dla smakoszy, uwzględniająca różnorodność kulinarną regionu.', '0', 1);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (18, 'Poznaj najstarsze restauracje w Trójmieście', 'Przemierzaj ulice Trójmiasta, odkrywając najstarsze restauracje pełne historii i smaku. Kulinarne doświadczenie to podróż w czasie przez najsmaczniejsze zakątki miasta.', 2, 5, 5, 250, 'brak', 10, 8, 'Gdańsk', 'Ogarna 27/28, 80-826 Gdańsk', NULL, NULL, 'w cenie degustacja we wszystkich restauracjach, dla miłośników dobrego jedzenia, dostosowana dla różnych grup wiekowych', '0', 3);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (19, 'Szlakiem browaru Amber', 'Zwiedzaj piwnicę browaru Amber, ucząc się sekretów warzenia piwa. Degustuj wyjątkowe trunki i poznaj fascynującą historię lokalnego browarnictwa.', 2, 3, 1, 50, 'brak', 20, 12, 'Bielkówko', 'Brunona Gregorkiewicza 1, 83-050 Bielkówko', NULL, NULL, 'w cenie niespodzianka od browaru, dla pasjonatów piwa, dostępne dla pełnoletnich gości', '0', 1);
    INSERT INTO trip(id, name, description_short, user_guide_id, duration, language_id, price, additional_fee, max_person_amount, min_person_amount, trip_town, meeting_point_address, geographical_coordinates, remember_about, additional_info, is_removed, length) VALUES (20, 'Wystawa plakatów wykonanych przez studentów uczelni w Trójmieście w tematyce "Ekologiczne Wyzwania"', 'Odkryj kreatywność studentów, zwiedzając wystawę plakatów poświęconą ekologicznym wyzwaniom. Wspieraj młodych artystów i czerp inspirację z ich dzieł.', 2, 3, 4, 5.5, 'brak', 30, 20, 'Gdańsk', 'Targ Węglowy 6, 80-836 Gdańsk', NULL, NULL, NULL, '0', 1);


    CREATE TABLE trip_category(
        id SERIAL NOT NULL PRIMARY KEY,
        category_id integer REFERENCES category(id),
        trip_id integer REFERENCES image(id)
    );

    INSERT INTO trip_category(id, category_id, trip_id) VALUES (1, 2, 1);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (2, 4, 1);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (3, 8, 2);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (4, 6, 3);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (5, 1, 4);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (6, 3, 4);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (7, 8, 5);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (8, 7, 5);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (9, 2, 6);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (10, 8, 6);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (11, 10, 7);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (12, 2, 7);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (13, 9, 8);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (14, 2, 8);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (15, 6, 8);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (16, 2, 9);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (17, 1, 10);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (18, 8, 10);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (19, 3, 10);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (20, 1, 11);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (21, 2, 12);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (22, 10, 12);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (23, 1, 13);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (24, 3, 13);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (25, 8, 13);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (26, 4, 14);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (27, 2, 14);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (28, 2, 15);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (29, 4, 15);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (30, 7, 15);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (31, 1, 16);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (32, 2, 16);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (33, 5, 17);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (34, 1, 17);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (35, 5, 18);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (36, 1, 18);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (37, 1, 19);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (38, 4, 19);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (39, 3, 20);
    INSERT INTO trip_category(id, category_id, trip_id) VALUES (40, 8, 20);

    CREATE TABLE trip_image(
        id SERIAL NOT NULL PRIMARY KEY,
        image_id integer REFERENCES image(id),
        trip_id integer REFERENCES image(id)
    );

    INSERT INTO trip_image(id, image_id, trip_id) VALUES (1, 1, 1);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (2, 2, 1);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (3, 3, 1);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (4, 4, 1);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (5, 5, 1);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (6, 1, 2);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (7, 2, 2);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (8, 3, 2);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (9, 4, 3);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (10, 5, 4);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (11, 6, 5);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (12, 7, 6);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (13, 8, 7);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (14, 9, 8);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (15, 10, 9);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (16, 11, 10);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (17, 12, 11);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (18, 13, 12);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (19, 14, 13);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (20, 15, 14);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (21, 16, 15);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (22, 17, 16);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (23, 18, 17);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (24, 19, 18);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (25, 20, 19);
    INSERT INTO trip_image(id, image_id, trip_id) VALUES (26, 20, 20);

EOSQL
