PGDMP     /    5                 {            taxi    14.3    14.3 :    H           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            I           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            J           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            K           1262    16542    taxi    DATABASE     O   CREATE DATABASE taxi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE taxi;
                postgres    false            �            1259    16566    brand    TABLE     S   CREATE TABLE public.brand (
    id integer NOT NULL,
    name character varying
);
    DROP TABLE public.brand;
       public         heap    postgres    false            �            1259    16565    brand_id_seq    SEQUENCE     �   ALTER TABLE public.brand ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    16595    car    TABLE     �   CREATE TABLE public.car (
    id integer NOT NULL,
    number character varying,
    idbrand integer,
    idmodel integer,
    idtype integer
);
    DROP TABLE public.car;
       public         heap    postgres    false            �            1259    16594 
   car_id_seq    SEQUENCE     �   ALTER TABLE public.car ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16558    client    TABLE     �   CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying,
    lastname character varying,
    birthdate date,
    phone character varying,
    iin character varying
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16557    client_id_seq    SEQUENCE     �   ALTER TABLE public.client ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    16544    driver    TABLE     �   CREATE TABLE public.driver (
    id integer NOT NULL,
    name character varying,
    lastname character varying,
    birthdate date,
    phone character varying,
    iin character varying,
    rating double precision
);
    DROP TABLE public.driver;
       public         heap    postgres    false            �            1259    16543    driver_id_seq    SEQUENCE     �   ALTER TABLE public.driver ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �            1259    16618    driversalary    TABLE     �   CREATE TABLE public.driversalary (
    id integer NOT NULL,
    iddriver integer,
    salary double precision,
    datesalary date
);
     DROP TABLE public.driversalary;
       public         heap    postgres    false            �            1259    16617    driversalary_id_seq    SEQUENCE     �   ALTER TABLE public.driversalary ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.driversalary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16582    model    TABLE     h   CREATE TABLE public.model (
    id integer NOT NULL,
    name character varying,
    idbrand integer
);
    DROP TABLE public.model;
       public         heap    postgres    false            �            1259    16581    model_id_seq    SEQUENCE     �   ALTER TABLE public.model ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    16645    route    TABLE     "  CREATE TABLE public.route (
    id integer NOT NULL,
    idschedule integer,
    idclient integer,
    taketime timestamp without time zone,
    finishtime timestamp without time zone,
    locationstart character varying,
    locationfinish character varying,
    costs double precision
);
    DROP TABLE public.route;
       public         heap    postgres    false            �            1259    16644    route_id_seq    SEQUENCE     �   ALTER TABLE public.route ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16629    schedule    TABLE     �   CREATE TABLE public.schedule (
    id integer NOT NULL,
    iddriver integer,
    idcar integer,
    procentdriver double precision,
    dateschedule date,
    busyornot boolean
);
    DROP TABLE public.schedule;
       public         heap    postgres    false            �            1259    16628    schedule_id_seq    SEQUENCE     �   ALTER TABLE public.schedule ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16574    type    TABLE     R   CREATE TABLE public.type (
    id integer NOT NULL,
    name character varying
);
    DROP TABLE public.type;
       public         heap    postgres    false            �            1259    16573    type_id_seq    SEQUENCE     �   ALTER TABLE public.type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            9          0    16566    brand 
   TABLE DATA                 public          postgres    false    214   =       ?          0    16595    car 
   TABLE DATA                 public          postgres    false    220   �=       7          0    16558    client 
   TABLE DATA                 public          postgres    false    212   �>       5          0    16544    driver 
   TABLE DATA                 public          postgres    false    210   w?       A          0    16618    driversalary 
   TABLE DATA                 public          postgres    false    222   A       =          0    16582    model 
   TABLE DATA                 public          postgres    false    218   )A       E          0    16645    route 
   TABLE DATA                 public          postgres    false    226   B       C          0    16629    schedule 
   TABLE DATA                 public          postgres    false    224   YC       ;          0    16574    type 
   TABLE DATA                 public          postgres    false    216   �C       L           0    0    brand_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.brand_id_seq', 10, true);
          public          postgres    false    213            M           0    0 
   car_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.car_id_seq', 11, true);
          public          postgres    false    219            N           0    0    client_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.client_id_seq', 4, true);
          public          postgres    false    211            O           0    0    driver_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.driver_id_seq', 15, true);
          public          postgres    false    209            P           0    0    driversalary_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.driversalary_id_seq', 1, false);
          public          postgres    false    221            Q           0    0    model_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.model_id_seq', 25, true);
          public          postgres    false    217            R           0    0    route_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.route_id_seq', 8, true);
          public          postgres    false    225            S           0    0    schedule_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.schedule_id_seq', 6, true);
          public          postgres    false    223            T           0    0    type_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.type_id_seq', 3, true);
          public          postgres    false    215            �           2606    16572    brand brand_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    214            �           2606    16601    car car_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    220            �           2606    16550    driver class_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT class_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.driver DROP CONSTRAINT class_pkey;
       public            postgres    false    210            �           2606    16564    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    212            �           2606    16622    driversalary driversalary_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.driversalary
    ADD CONSTRAINT driversalary_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.driversalary DROP CONSTRAINT driversalary_pkey;
       public            postgres    false    222            �           2606    16588    model model_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.model DROP CONSTRAINT model_pkey;
       public            postgres    false    218            �           2606    16651    route route_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.route DROP CONSTRAINT route_pkey;
       public            postgres    false    226            �           2606    16633    schedule schedule_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_pkey;
       public            postgres    false    224            �           2606    16580    type type_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.type DROP CONSTRAINT type_pkey;
       public            postgres    false    216            �           2606    16602    car fk_brandcar    FK CONSTRAINT     n   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fk_brandcar FOREIGN KEY (idbrand) REFERENCES public.brand(id);
 9   ALTER TABLE ONLY public.car DROP CONSTRAINT fk_brandcar;
       public          postgres    false    214    3475    220            �           2606    16589    model fk_brandmodel    FK CONSTRAINT     r   ALTER TABLE ONLY public.model
    ADD CONSTRAINT fk_brandmodel FOREIGN KEY (idbrand) REFERENCES public.brand(id);
 =   ALTER TABLE ONLY public.model DROP CONSTRAINT fk_brandmodel;
       public          postgres    false    214    3475    218            �           2606    16639    schedule fk_carschedule    FK CONSTRAINT     r   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT fk_carschedule FOREIGN KEY (idcar) REFERENCES public.car(id);
 A   ALTER TABLE ONLY public.schedule DROP CONSTRAINT fk_carschedule;
       public          postgres    false    220    3481    224            �           2606    16657    route fk_clientroute    FK CONSTRAINT     u   ALTER TABLE ONLY public.route
    ADD CONSTRAINT fk_clientroute FOREIGN KEY (idclient) REFERENCES public.client(id);
 >   ALTER TABLE ONLY public.route DROP CONSTRAINT fk_clientroute;
       public          postgres    false    212    226    3473            �           2606    16623 "   driversalary fk_driverdriversalary    FK CONSTRAINT     �   ALTER TABLE ONLY public.driversalary
    ADD CONSTRAINT fk_driverdriversalary FOREIGN KEY (iddriver) REFERENCES public.driver(id);
 L   ALTER TABLE ONLY public.driversalary DROP CONSTRAINT fk_driverdriversalary;
       public          postgres    false    222    210    3471            �           2606    16634    schedule fk_driverschedule    FK CONSTRAINT     {   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT fk_driverschedule FOREIGN KEY (iddriver) REFERENCES public.driver(id);
 D   ALTER TABLE ONLY public.schedule DROP CONSTRAINT fk_driverschedule;
       public          postgres    false    3471    224    210            �           2606    16607    car fk_modelcar    FK CONSTRAINT     n   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fk_modelcar FOREIGN KEY (idmodel) REFERENCES public.model(id);
 9   ALTER TABLE ONLY public.car DROP CONSTRAINT fk_modelcar;
       public          postgres    false    220    3479    218            �           2606    16652    route fk_scheduleroute    FK CONSTRAINT     {   ALTER TABLE ONLY public.route
    ADD CONSTRAINT fk_scheduleroute FOREIGN KEY (idschedule) REFERENCES public.schedule(id);
 @   ALTER TABLE ONLY public.route DROP CONSTRAINT fk_scheduleroute;
       public          postgres    false    3485    226    224            �           2606    16612    car fk_typecar    FK CONSTRAINT     k   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fk_typecar FOREIGN KEY (idtype) REFERENCES public.type(id);
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT fk_typecar;
       public          postgres    false    216    220    3477            9   �   x����
�0�{�"�*�Xw��5Ц�Ċ�ԆZ(����M��_�4|�P&��2�O��k�XU�8�	��L����$��!��!��Ç7�#��1wƭk�T� gᜠ/r�j����&�T��r�E[�,�Y;��ֶ)�p՚�l�-�5��A��I�t�V Ɵ9��U�~��1R��      ?   �   x����
�0 ����7D��vOq�Yt����7�I� ��oj��P�<�&э);�tc[��ܟ�~��ެue��n*f.Ɩ5sx8�!6�9� �jS�'s���։�	⮜����-����=y�"BJ"���xq��"b�2*s<'�q�?8姱R�V�pY.�f�VQ�Xy/��j�-*j��-z�2!�<�n�̫�}*d��p�@�д=0H�|ж�      7   �   x���A�0�����V���E:	�����KD΂�ߟ+�u����OH�K����O���ۺ��0���e)�B��(�O���3�\�Vt��r��z<�lZg���3MSI�W� ��R �RFb@$�w���Ͷ�s͈��df���xkn��2�u�=��cg�_�A�	�}�      5   �  x����k�0���+���,�cv*T��,T[�1]��UV\-쿟1�M�i�Ĩ��~�/J�p�9Q�-�C����mU���Y���2�Gɛ�~�Y��g�*�k�<����6�{}��C�a���@%���'`" s�������I��<n�̊R��cY�j\ � \�EݷT'Z��\s�B�� �7Z3��_�V\X��*�b�WE٦_2?�s���T;(�W�Xea�N���W��n�s���Z��&�V�iBp�N��z��{��S��(��Ɩ�3E��k���F_��7�7��s+�d�V��1��Z�px0�a$x�a�䆞���?�z�/�hLx2���u�&^Z�]�Wg'����sb��Rt!����{sY�4!����� 0��L�����      A   
   x���          =   F  x����N�@��;O1�jҘR(m㉴hH
��M=���MʮJ"'}����h���>�s���Ϳ�i�d�����{�_U��{Xo�$	�a|�C�l��}�s�paa��C�/�������**8��>�o����s�S[�2A%5Z4�1G�P��\�+Mi&�;ɵfh%B���r��#�TuN�+�G�ɝ�2��GkB.��SQD�߸ΈQ����3U��hy,���fl���D�:��,���e3Թ�Jz�kuR�ñ�l���U+���U��,�_	] ް�0ϣ��D��"�����}%�ײ�oD(�      E   �   x���A�0���,И�U��Hb�΄�+FJa����f�"����~�O��$�­9\��H^�Z�6�Ҕ.i��gYCnvQ�2<#��s:������u�+��n�s�5��JQq5���ܢ��&`���Y��S	و� �M�M:���('n������H�l�t�,xY)�iI�� Ǩ��      C   �   x���v
Q���W((M��L�+N�HM)�IU�s
�t��sW�q�Us�	u���
�:
d���nd`d�k`�k`���PRT��i��I��F:
d��a|ZbN1��M#Z8�DG���tS��Mi�t3�p:�p.. :s��      ;   v   x���v
Q���W((M��L�+�,HU�s
�t��sW�q�Us�	u���
�:
��^�ua߅�@�G]Ӛ˓L��@f��r��¾��(1�d��;.l�l��F�Y\\ �NQ�     