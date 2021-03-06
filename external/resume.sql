PGDMP                     
    t            resume    9.5.4    9.5.4 Q    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    33170    resume    DATABASE     �   CREATE DATABASE resume WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE resume;
             resume    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                        3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    33171    certificate    TABLE     �   CREATE TABLE certificate (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(50) NOT NULL,
    large_url character varying(255) NOT NULL,
    small_url character varying(255) NOT NULL
);
    DROP TABLE public.certificate;
       public         resume    false    6            �            1259    33305    certificate_seq    SEQUENCE     q   CREATE SEQUENCE certificate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.certificate_seq;
       public       resume    false    6            �            1259    33176    course    TABLE     �   CREATE TABLE course (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(60) NOT NULL,
    school character varying(60) NOT NULL,
    finish_date date
);
    DROP TABLE public.course;
       public         resume    false    6            �            1259    33307 
   course_seq    SEQUENCE     l   CREATE SEQUENCE course_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.course_seq;
       public       resume    false    6            �            1259    33181 	   education    TABLE       CREATE TABLE education (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    summary character varying(100) NOT NULL,
    begin_year integer NOT NULL,
    finish_year integer,
    university text NOT NULL,
    faculty character varying(255) NOT NULL
);
    DROP TABLE public.education;
       public         resume    false    6            �            1259    33309    education_seq    SEQUENCE     o   CREATE SEQUENCE education_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.education_seq;
       public       resume    false    6            �            1259    33189    hobby    TABLE     x   CREATE TABLE hobby (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.hobby;
       public         resume    false    6            �            1259    33311 	   hobby_seq    SEQUENCE     k   CREATE SEQUENCE hobby_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.hobby_seq;
       public       resume    false    6            �            1259    33194    language    TABLE     �   CREATE TABLE language (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(30) NOT NULL,
    level character varying(18) NOT NULL,
    type character varying(7) DEFAULT 0 NOT NULL
);
    DROP TABLE public.language;
       public         resume    false    6            �            1259    33313    language_seq    SEQUENCE     n   CREATE SEQUENCE language_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.language_seq;
       public       resume    false    6            �            1259    33200    persistent_logins    TABLE     �   CREATE TABLE persistent_logins (
    username character varying(64) NOT NULL,
    series character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp(0) without time zone NOT NULL
);
 %   DROP TABLE public.persistent_logins;
       public         resume    false    6            �            1259    33205    practic    TABLE     G  CREATE TABLE practic (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    "position" character varying(100) NOT NULL,
    company character varying(100) NOT NULL,
    begin_date date NOT NULL,
    finish_date date,
    responsibilities text NOT NULL,
    demo character varying(255),
    src character varying(255)
);
    DROP TABLE public.practic;
       public         resume    false    6            �            1259    33315    practic_seq    SEQUENCE     m   CREATE SEQUENCE practic_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.practic_seq;
       public       resume    false    6            �            1259    33213    profile    TABLE     F  CREATE TABLE profile (
    id bigint NOT NULL,
    uid character varying(100) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_day date,
    phone character varying(20),
    email character varying(100),
    country character varying(60),
    city character varying(100),
    objective text,
    summary text,
    large_photo character varying(255),
    small_photo character varying(255),
    info text,
    password character varying(255) NOT NULL,
    completed boolean NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL,
    skype character varying(80),
    vkontakte character varying(255),
    facebook character varying(255),
    linkedin character varying(255),
    github character varying(255),
    stackoverflow character varying(255)
);
    DROP TABLE public.profile;
       public         resume    false    6            �            1259    33228    profile_restore    TABLE     d   CREATE TABLE profile_restore (
    id bigint NOT NULL,
    token character varying(255) NOT NULL
);
 #   DROP TABLE public.profile_restore;
       public         resume    false    6            �            1259    33317    profile_seq    SEQUENCE     m   CREATE SEQUENCE profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.profile_seq;
       public       resume    false    6            �            1259    33233    skill    TABLE     �   CREATE TABLE skill (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    category character varying(50) NOT NULL,
    value text NOT NULL
);
    DROP TABLE public.skill;
       public         resume    false    6            �            1259    33241    skill_category    TABLE     e   CREATE TABLE skill_category (
    id bigint NOT NULL,
    category character varying(50) NOT NULL
);
 "   DROP TABLE public.skill_category;
       public         resume    false    6            �            1259    33319 	   skill_seq    SEQUENCE     k   CREATE SEQUENCE skill_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.skill_seq;
       public       resume    false    6            �          0    33171    certificate 
   TABLE DATA               J   COPY certificate (id, id_profile, name, large_url, small_url) FROM stdin;
    public       resume    false    181   �X       �           0    0    certificate_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('certificate_seq', 21, true);
            public       resume    false    192            �          0    33176    course 
   TABLE DATA               D   COPY course (id, id_profile, name, school, finish_date) FROM stdin;
    public       resume    false    182   �[       �           0    0 
   course_seq    SEQUENCE SET     1   SELECT pg_catalog.setval('course_seq', 9, true);
            public       resume    false    193            �          0    33181 	   education 
   TABLE DATA               c   COPY education (id, id_profile, summary, begin_year, finish_year, university, faculty) FROM stdin;
    public       resume    false    183   )\       �           0    0    education_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('education_seq', 24, true);
            public       resume    false    194            �          0    33189    hobby 
   TABLE DATA               .   COPY hobby (id, id_profile, name) FROM stdin;
    public       resume    false    184   _]       �           0    0 	   hobby_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('hobby_seq', 120, true);
            public       resume    false    195            �          0    33194    language 
   TABLE DATA               >   COPY language (id, id_profile, name, level, type) FROM stdin;
    public       resume    false    185   x`       �           0    0    language_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('language_seq', 63, true);
            public       resume    false    196            �          0    33200    persistent_logins 
   TABLE DATA               H   COPY persistent_logins (username, series, token, last_used) FROM stdin;
    public       resume    false    186   Eb       �          0    33205    practic 
   TABLE DATA               u   COPY practic (id, id_profile, "position", company, begin_date, finish_date, responsibilities, demo, src) FROM stdin;
    public       resume    false    187   bb       �           0    0    practic_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('practic_seq', 42, true);
            public       resume    false    197            �          0    33213    profile 
   TABLE DATA               �   COPY profile (id, uid, first_name, last_name, birth_day, phone, email, country, city, objective, summary, large_photo, small_photo, info, password, completed, created, skype, vkontakte, facebook, linkedin, github, stackoverflow) FROM stdin;
    public       resume    false    188   =e       �          0    33228    profile_restore 
   TABLE DATA               -   COPY profile_restore (id, token) FROM stdin;
    public       resume    false    189   |q       �           0    0    profile_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('profile_seq', 24, true);
            public       resume    false    198            �          0    33233    skill 
   TABLE DATA               9   COPY skill (id, id_profile, category, value) FROM stdin;
    public       resume    false    190   �q       �          0    33241    skill_category 
   TABLE DATA               /   COPY skill_category (id, category) FROM stdin;
    public       resume    false    191   ow       �           0    0 	   skill_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('skill_seq', 207, true);
            public       resume    false    199            �           2606    33175    certificate_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY certificate
    ADD CONSTRAINT certificate_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.certificate DROP CONSTRAINT certificate_pkey;
       public         resume    false    181    181                        2606    33180    course_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public         resume    false    182    182                       2606    33188    education_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.education DROP CONSTRAINT education_pkey;
       public         resume    false    183    183                       2606    33193 
   hobby_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY hobby
    ADD CONSTRAINT hobby_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.hobby DROP CONSTRAINT hobby_pkey;
       public         resume    false    184    184            
           2606    33199    language_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.language DROP CONSTRAINT language_pkey;
       public         resume    false    185    185                       2606    33204    persistent_logins_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY persistent_logins
    ADD CONSTRAINT persistent_logins_pkey PRIMARY KEY (series);
 R   ALTER TABLE ONLY public.persistent_logins DROP CONSTRAINT persistent_logins_pkey;
       public         resume    false    186    186                       2606    33212    practic_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY practic
    ADD CONSTRAINT practic_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.practic DROP CONSTRAINT practic_pkey;
       public         resume    false    187    187                       2606    33227    profile_email_key 
   CONSTRAINT     N   ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_email_key;
       public         resume    false    188    188                       2606    33225    profile_phone_key 
   CONSTRAINT     N   ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_phone_key UNIQUE (phone);
 C   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_phone_key;
       public         resume    false    188    188                       2606    33221    profile_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public         resume    false    188    188                       2606    33232    profile_restore_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.profile_restore DROP CONSTRAINT profile_restore_pkey;
       public         resume    false    189    189                       2606    33254    profile_restore_uid_key 
   CONSTRAINT     \   ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_uid_key UNIQUE (token);
 Q   ALTER TABLE ONLY public.profile_restore DROP CONSTRAINT profile_restore_uid_key;
       public         resume    false    189    189                       2606    33223    profile_uid_key 
   CONSTRAINT     J   ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_uid_key UNIQUE (uid);
 A   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_uid_key;
       public         resume    false    188    188            !           2606    33247    skill_category_category_key 
   CONSTRAINT     b   ALTER TABLE ONLY skill_category
    ADD CONSTRAINT skill_category_category_key UNIQUE (category);
 T   ALTER TABLE ONLY public.skill_category DROP CONSTRAINT skill_category_category_key;
       public         resume    false    191    191            #           2606    33245    skill_category_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY skill_category
    ADD CONSTRAINT skill_category_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.skill_category DROP CONSTRAINT skill_category_pkey;
       public         resume    false    191    191                       2606    33240 
   skill_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.skill DROP CONSTRAINT skill_pkey;
       public         resume    false    190    190            �           1259    33304    certificate_idx    INDEX     F   CREATE INDEX certificate_idx ON certificate USING btree (id_profile);
 #   DROP INDEX public.certificate_idx;
       public         resume    false    181            �           1259    33297 
   course_idx    INDEX     <   CREATE INDEX course_idx ON course USING btree (id_profile);
    DROP INDEX public.course_idx;
       public         resume    false    182            �           1259    33298    course_idx1    INDEX     >   CREATE INDEX course_idx1 ON course USING btree (finish_date);
    DROP INDEX public.course_idx1;
       public         resume    false    182                       1259    33290    education_idx    INDEX     B   CREATE INDEX education_idx ON education USING btree (id_profile);
 !   DROP INDEX public.education_idx;
       public         resume    false    183                       1259    33291    education_idx1    INDEX     D   CREATE INDEX education_idx1 ON education USING btree (finish_year);
 "   DROP INDEX public.education_idx1;
       public         resume    false    183                       1259    33284 	   hobby_idx    INDEX     :   CREATE INDEX hobby_idx ON hobby USING btree (id_profile);
    DROP INDEX public.hobby_idx;
       public         resume    false    184                       1259    33278    language_idx    INDEX     @   CREATE INDEX language_idx ON language USING btree (id_profile);
     DROP INDEX public.language_idx;
       public         resume    false    185                       1259    33266    practic_idx    INDEX     >   CREATE INDEX practic_idx ON practic USING btree (id_profile);
    DROP INDEX public.practic_idx;
       public         resume    false    187                       1259    33267    practic_idx1    INDEX     @   CREATE INDEX practic_idx1 ON practic USING btree (finish_date);
     DROP INDEX public.practic_idx1;
       public         resume    false    187                       1259    33260 	   skill_idx    INDEX     :   CREATE INDEX skill_idx ON skill USING btree (id_profile);
    DROP INDEX public.skill_idx;
       public         resume    false    190            $           2606    33299    certificate_fk    FK CONSTRAINT     �   ALTER TABLE ONLY certificate
    ADD CONSTRAINT certificate_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.certificate DROP CONSTRAINT certificate_fk;
       public       resume    false    181    2070    188            %           2606    33292 	   course_fk    FK CONSTRAINT     �   ALTER TABLE ONLY course
    ADD CONSTRAINT course_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.course DROP CONSTRAINT course_fk;
       public       resume    false    182    2070    188            &           2606    33285    education_fk    FK CONSTRAINT     �   ALTER TABLE ONLY education
    ADD CONSTRAINT education_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.education DROP CONSTRAINT education_fk;
       public       resume    false    183    2070    188            '           2606    33279    hobby_fk    FK CONSTRAINT     �   ALTER TABLE ONLY hobby
    ADD CONSTRAINT hobby_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.hobby DROP CONSTRAINT hobby_fk;
       public       resume    false    184    2070    188            (           2606    33273    language_fk    FK CONSTRAINT     �   ALTER TABLE ONLY language
    ADD CONSTRAINT language_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 >   ALTER TABLE ONLY public.language DROP CONSTRAINT language_fk;
       public       resume    false    185    188    2070            )           2606    33268    persistent_logins_fk    FK CONSTRAINT     �   ALTER TABLE ONLY persistent_logins
    ADD CONSTRAINT persistent_logins_fk FOREIGN KEY (username) REFERENCES profile(uid) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.persistent_logins DROP CONSTRAINT persistent_logins_fk;
       public       resume    false    186    2072    188            *           2606    33261 
   practic_fk    FK CONSTRAINT     �   ALTER TABLE ONLY practic
    ADD CONSTRAINT practic_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.practic DROP CONSTRAINT practic_fk;
       public       resume    false    187    188    2070            +           2606    33248    profile_restore_fk    FK CONSTRAINT     �   ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_fk FOREIGN KEY (id) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.profile_restore DROP CONSTRAINT profile_restore_fk;
       public       resume    false    189    188    2070            ,           2606    33255    skill_fk    FK CONSTRAINT     �   ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;
 8   ALTER TABLE ONLY public.skill DROP CONSTRAINT skill_fk;
       public       resume    false    188    2070    190            �   �  x���K�#7��է�pZ����ِ�8� �@z.d�@Fm���������?�����\�����)��׿};޿/����<�|:���R����t��(;f�%�����zK��'H/��B���Z�.+��?��?�ڂjٻ���q��JP�֘P���(>�6���E�'�0�D0heś|�rK��*�؆b-�
��f��m Q�7r��gjG����>Ur�����E��A�,a��%~P���*r<��Q)a�L�ת�frf���%~P��j�X��i�Qb��M������xK���\y�*�%�ңg�A�ٔ���ְ#~pa:�v˘$��zLuk1��c�*U�M��8��_Xx�=����f`�â�����SQ�<���¢k����
.���)/���Q���?�2?o���l��RY�
V(��<rQ�-�Qxb�%�����ϗz:rN��-�V�3��K�$�_`���節;�� )�@�J��"���:�L���ώ�ª'�+�e�.y��Sl���9l��$z��;�����u�ѡ+�E�����p�QVj<�d<ߌ;����c�5�=�:S��"s�u.��(�n�/�qb���I��ҠY�I��h��9sy9�-�u?M�/m��i��1.N#�.�j��Q�ڔ���n�/,<��Njk-��9nQ��w!b��[��__����yr�;      �   {   x���=�@����)� N�J�F-<͎l��r~-BK쟼�Dp+kiN�Z^�:6����������-ǶcR$�r6�A��GH�� ���p���x�S�M���3�?l�XUG�Á��¯qa      �   &  x���Mj�0FןO����{��B6mv٨F$"�Rl7��w�������iFo~��t6K\�b>��-.+lMu�Z|\�|�Os�k|$3_a��8���3̼������)�=�aοM���������i�,�D��L��D'�L$Mb��0�E[�ء+L�ы�vkXE‡p��H3��$��@y�T�*�v
���#���i��j2�l}�r�H�ϐ�N�فd����A��v�� �-�C�$zh��b�/�C�c�ڡ��@��NU"7H���-��Myz���Y���      �   	  x�]��n�0E��W�
>Er�8HZ�&h7�Њ��@v���{��dɻ9�Cr8J&ٟ�}ݞ����^��r����a����5'nHn�����[�]{ܒW�{���Y��á=r�&}v��aߥ7V]� �S�Ѣ��8��K�4��q�:v�K{.��mJ94�A�m�40opΪo�s^��k�]1þ��j���K�n�q��! �]J���~J��i��ȕdѧ�R�EtJC�ʞ��>�����Q��m��W�媇r�/��iA;�����I]���b��?c{(�A_�z��g�-m�)qma�խ�g��~u�Ų�A{���J�u�y��n���F��#>��`OP��1!�� M���GR���D��r�L {�
�o��Se%C�������HX4��$�ۚ�a�ն��YJ-�S�w��C=IS�6>�ۚW�xլ�S_)�i�4�ؑ�!�\Y�R�
�P��JU.�xs�	�i��~B=_�/���r��e�:�f���"{z��c�Ick9�݇�r�𪥝#�*.�I���eD^�]S)<BtSX^�.���1DCCzK0��G|~x�wd����h,�D�gA�,���¬9�"���I�?�q��%��#�WG44A�Ӿ@T!� �����˪��C��QH���l)�<Rh�柯0�<�����lI�i�ᩩ R8��(H�����@8~���+v��Ƙ)�s�l�W<�C�$�4M�DӂK,�85�D�(s����ԣ�oP<)×+�qe�oF!^����?kH�      �   �  x���MN�0�דà�7� �f��Bk�E�F&��=6�L�2v���ߌ�Ƕ ��0��7xq��0NS#xX�ɏ��.,c������B�x���á� ��s�]|�aq���~\���
�,��,7ہ&��	>�c�p��me�i�т�2̮���ZCH�W�"T]F�4t�j�Ǵ�BO|��a��g�q���;�CW��PiY
�r���]<$�*",�!�%S�o�������|�;�iK�ˊ�T7]�b}MDVY�L��J�P��(Y��ʊ����R)L}��*sA�٬�ׅm�+)�"ek�)5\�у�b�����*ZfJ3��V�'�qw��)���9�S�mUE�,ÄY��� ����NV�״ ��mD��O_z�b�YHQ>.�Y��M��o�Z����,�,%�!cfr6��j�܊�`-nS`�O���"O7M��c��|      �      x������ � �      �   �  x��]o� ��ɯ�7ik���ڤ��5q�D�4U�pBkW�A�ڿ4�&+q'�Jg��s8� WdM��rM�]��+A���Ƕ�#��q���������O4���"_�����Kz\QQ������2&�����k(�D�!\���`d�:���
楤%�'���ZUэ�D��
ӟ���� )��溭����+�HJϾ�����	��2)������闻yr7��$w�������<�2�ӓ[�Γq2�[0���$f5'�%-�Ö�}E�;aH8-gY~/7�fL�/���UIoƪ$����'�@6�H{��`h�Z���v���Uoe�*�\�aS���Q7]�R�����)��W�UR���!��%�!����̩��י��8������Hwq;D���Y��GZ�A`��60�ْ�{���@x��0�:�����G_,�֨[�x@ٵ��X|�:�I���>:�  �0��	�%�Md���A���
��g�zf��`���`���m��⼎ym_�D;c>��� �Á�����㷀y+�W�Wh��u�"��n[
GlpԶ��+��y�=2�l>�6X���=w/o�l�ŝ���m����>���N�� ��O�z��� �q�,������}ap���x��Uٞc�(�pǃ��*DV9�ۓ�`����6      �   /  x��[K�۶^S���,�SaL� xU�Nj;��c�I��^���C�c�ί�%)�(�r�I��IWC �)�����Rea>xO����{�BD�o!��E��$��}�I�^�"��y]J�[����{��(�w�F���ش������]�{?���vlW��*蓩����l�ߺz;�\��k���ʗ�]�lg��*-6�̍_ڪɬ��o]~]�uЬ�ei��o���ޣ�'�+kY>
Xb�H�(Bű@�X�b�B&IƘ\��m�CU�!�U�T�6�_6u�dk?s~n�oS�ټ���u�I�ڷeQ�����R�'K?wU�������)t����_\[@�0ݕ��(��"M�r��M�K�Wr�l~�}A�8��}�䖽y^��m���/�������Us��[G\�%)~~�a��œ�����^� 3�1
B��ǘ?����ko[׻��G7׭���3�$R[U'� �Z���ƖIZ�NDW����Uhk��(���m{����N���g��J���~g�s�3'��3�R�*Dul��a�g$�R�3$]H
ʸ E�������i�	��|�k�Y��^����];��lUf
������`�
�d��1�b|
~���&ҁL�<őF��)�1�2I [��sFn	���ı���j5����vA��R�j������yϺ&��	�"h]YƂ�q<�-�uݍ؃�;-���k�D�En��e���ȫ���<��J&�F���21HZ�g�D�
3:����=k�_�����ڱ��d��Z�2�5x!����ߪ
#S n%A5Her��86��ĀLFO�r�W��ȳY&ѭ�+X���������	�"F�pϐ�;��9kp�!8��w�Tp6�I"��dHp+M�B<w@��1�*��p�
��8d?�v�v���+�i)+�@졚�"�8>Ɗ<k1�B�I2�Z1ϖ��[���f2�tm�ˡ��v0(��@�<αe+�k����҂01F
Q�`��TH�$'KA����
=��*�"�.��vg��֧500fZ�˲�q3D���j�J[��Kg�00�no��`:���&�K�����ij�9��:J[;���M+]���ݴ氵�t��S�	t��]6�eg���5U]�GV���e�`���M��ZB�{���R7�j�L�<�8
�f����޶���A��W��=���OC6BQX�!I�����'�%f�5c#���)aU�"�U�d��T�Y��KFD�EDS�޸�N�!CY����ޫ���Q ^�`� q�tXh�N���|\g�{8#�,����9!E\�%ZFD���P��r	쒺���2٪�s��̩;	���^�rd[$ jj[z��]������@V��F�:�wV�I� I�搽@`L9��� ��-�IefX�vY���kB��He�3r�V�#���Tx`�[ p�rW�b Y��Ӿ8��'�6�F�b~
~ V(��*��12j]�`)�*���8����e�5�(�����`q�o�������{m�CT�����"���X$�Hł0� A�;�+cj6�.�]VqSM�¹�#�0���R+L��u�����<{���a[cv�:('���υ>��H�%6��0X3$C"��\Cb�g��v�M}B����EgdNm�Hp�C/��������}�'.!%���C�c8��|x[��,8͈��`&'���?<[&XKc!G��A��"�� k�i��	�g��.lO�8����Y�@��c_a�e�Vf���Ő���I�����Ps� ���'�M�cP4��(C @�V�XY�	��,��ybs+�q"�.���������_~�6�y�(��հ�m}�P�q����R����'m�Cf~
�z�R��R���5 ���r_cIl�q0�j����sSz���2��ЌmI� ��AO��VÕ���oz���.��"C�,!?�=�K@�b���ȆZiNB0ds�����W�\v�;�0�h���A�]�x��忎��sp������P�-0V~"�թ�R__���O]�!����#�����3�$>\�	��+Q�*0�����韻�_!2�l���ho���l)��VɐE�B>$Ty��	aq��\]|l���[Y�w9�s7��.��ǵk��K]��_�8�2XG�`s��R����f�.�\��c��*��:;�Ƒ�
b�R�k�𮋢ޖ���$����o�}}}�k8ԣI����	�{{�s�'O� �bH�D�H�4ABKE�	������o;�v�i�)����c]ۺ����\��5����BX�0C�ѝ���It�-���P����Ql��s���`�9P�ɛ���7�fhy�ط�T*Fd(�Ą	F�cП��rjd E�0ȥe{�bY���Xk19{��v�tJL4:q�ǃg�s�b��x9���u��u������@TI;��=c��"B�)���?�8NJ�H� ��!F�(�TL,"Dh!	�
��,�]X�'ʘ*�����9��ƒ���,S[���y՞��wy/���M���++�������˝��-"���))�
�$���|�{-�-�����nd��@���!X�$9�Z�I3��0jFb\�'ث�65E�tѪ�{�7��}����!`Y�9�=�}�½�nb�Hi#�	R�i�p�cڄ�UL���|������l�����5 p���z���k/�R�єuǜZp���"ī���YT7e�Ҳky?���Р-c+�X�<������]�04�$nm4�Q(XBF�����.���:e���+o�"C[gLj��C���Cs������#�	�a�[
�DAZ	�(Xh�4D6l��RZ��.�.��T��r�P~�S0�q{��7H�u��2��	������(�ke��R����+���O�79�C��� �3�i�kx��Io\.˵߅B��qg�}1��������-�~s���J�]���oy_w�>��Bb��������%�LU�F*jK�,N���0�sǣK`��gb«��юg���L�_�V�� Pr"      �      x������ � �      �   �  x��Y�n�H=�_�������-�a'd$s�-3�Y�h1&?�$��i6Ii�6��z]�~���SSF�E9��q�����rP�\����%ҧǗ��^,��j��4W�}�n�ח�������u�\,��>~YU��]��ݖ�I=�5q�l�0�����דAqQ�o����Qo�?-�eq~u4(���]U�����l���j>Y�*&7�|V.��]9�n��G1�G�rZ]}Ġj�8��~~z�+������&7����Yv6�NU��gg�i�XM�j�[ N����%*L�w���m�X_��/���~T"�i<���{d�W��m���XV��e�X�������6;��>?T�����2'��.9���� �����¨׭i��-	@bM�ni��	U�s��,!S��D �"	��e��^�,R��nY�$�E�!-�H�tB�VJ�3ɒˀ�Z�˟뛕��5��w���>~���8Fc�ϟrE@tOGI@��(�`�_�3ӵX�A�qO��Xr�|��+���� ���b3��5!� SK�����V���Vk�cn�A���Ũ׽�C��ZhHC��!�E#�Nha�k�6����7�Q�=ۈF�s�F4���H<�L��3�Z,�	Hī�
��iI춠%@7Kc'Rjal��WCBH+Q���C���Mϑ��5�'����|Ϻ,t�)�o���~��/w�r��wS�$ ��:��`�q���p�����Q$נs��iu����B�+��\��,O����r�w���D�(��u������#���������=c)_�+v�cb�m���
�)ˠ�u"�X�4�0 �-X��}�c�������=�4\��Y�� AH9!�w���� $4#"����G�p�p�&,�{կ!���N�q�=Nx5�[����탒���Q��2d��4D[1�MH��s��0��߬�p��g����6�`�7��
���+&����N�E���tZ�J{z-����t[�L}~�����ƙ�<�?S�u\4=�]M�΋`���v����	#�lz�6�c�(�������)�e�M=��R�Z���S���+$�:�V!aԑ=\HyroVH���!�fPCHm���	�-RB��sŤ�p����OBF�		�OI��#�!�V�4����NY1�!��[�ڄ4�)!�]WL
i rl��}��	����oP�
��L���_�K���*�I�[jV3�񨵆��=j�e�>j�����jr�m=rH��h]��Q�d&����T�f�9��&g�+m09�%{�s�A���;ar�3�s�.ya�`����KF������wD�y�[�#z�����-��y�e�m�{π��a]1}�}��v F46B�>\��xܫVMjn�G�`�*�-1mBǀ�P��+�����fZ
���Ѩ ~8*$�{�BI��ɞR��8"fKL�!��H�
�������<��,      �   \   x�3��I�K/MLO-�2�tq��2�OM�2��J,K�2��tq�2�t�2I(���sYp:�f�(W���rYr:�䗦p��qqq �      